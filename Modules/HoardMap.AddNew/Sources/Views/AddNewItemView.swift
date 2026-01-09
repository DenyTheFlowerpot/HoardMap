//
//  AddNewItemView.swift
//  HoardMap.AddNew
//
//  Created by Theodor Gheghea on 07.01.2026.
//

import HoardMap_Persistence
import HoardMap_SharedUI
import SwiftUI
import PhotosUI

public struct AddNewItemForm {
    let initialDateAcquired = Date()

    var name = ""
    var dateAcquired: Date
    var state: ItemState = .NotApplicable
    var image = Data()

    var allowAdd: Bool {
        !name.isEmpty
    }

    public var allowDismiss: Bool {
        name.isEmpty && dateAcquired == initialDateAcquired
        && state == .NotApplicable && image.isEmpty
    }

    public init() {
        self.dateAcquired = initialDateAcquired
    }
}

public struct AddNewItemView: View {
    @Binding var form: AddNewItemForm
    @Environment(\.dismiss) var dismiss
    @State var itemPickerItem: PhotosPickerItem?
    @State var itemImage: Image?
    @State var itemImageLoading = false

    public var body: some View {
        
        Form {
            PhotosPicker(selection: $itemPickerItem, matching: .images) { [itemImage, itemImageLoading] in
                if let itemImage {
                    itemImage
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                } else {
                    ZStack() {
                        if itemImageLoading {
                            ProgressView()
                        } else {
                            ContentUnavailableView("Add Picture", systemImage: "photo.badge.plus")
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                }
            }
                .onChange(of: itemPickerItem, loadImage)
            TopLabeledTextField("Name", text: $form.name)
                .listRowSeparator(.hidden)
            LabeledContent {
                DatePicker(
                    "",
                    selection: $form.dateAcquired,
                    displayedComponents: [.date]
                )
            } label: {
                Text("Date Acquired")
                    .font(.callout)
            }
            .listRowSeparator(.hidden)
            LabeledContent {
                Picker("", selection: $form.state) {
                    ForEach(ItemState.allCases) { state in
                        Text(state.rawValue).tag(state)
                    }
                }
            } label: {
                Text("State")
                    .font(.callout)
            }
            .listRowSeparator(.hidden)
            Button {
                
            } label: {
                Text("Add")
                    .frame(
                          maxWidth: .infinity,
                          minHeight: 32,
                          maxHeight: 32
                        )
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .buttonBorderShape(.capsule)
        }
        .scrollContentBackground(.hidden)
        .background(Color(UIColor.systemBackground))
        .navigationTitle("Add Item")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: { dismiss() }) {
                    ExitButtonView()
                }
            }
        }
    }
    
    private func loadImage(_: PhotosPickerItem?, selectedItem: PhotosPickerItem?) {
        Task {
            self.itemImage = nil
            itemImageLoading = true
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            form.image = imageData
            self.itemImage = try await selectedItem?.loadTransferable(type: Image.self)
            itemImageLoading = false
        }
    }

    public init(form: Binding<AddNewItemForm>) {
        self._form = form
    }
}

#Preview {
    @Previewable @State var form = AddNewItemForm()
    Text("Blank")
        .sheet(isPresented: .constant(true)) {
            NavigationStack {
                AddNewItemView(form: $form).interactiveDismissDisabled(
                    !form.allowDismiss
                )
            }
        }
}
