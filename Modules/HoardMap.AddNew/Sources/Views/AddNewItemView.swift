//
//  AddNewItemView.swift
//  HoardMap.AddNew
//
//  Created by Theodor Gheghea on 07.01.2026.
//

import SwiftUI
import HoardMap_Persistence

public struct AddNewItemForm {
    let initialDateAcquired = Date()
    
    var name = ""
    var dateAcquired: Date
    var state: ItemState = .NotApplicable
    
    var allowAdd: Bool {
        !name.isEmpty
    }
    
    public var allowDismiss: Bool {
        name.isEmpty && dateAcquired == initialDateAcquired && state == .NotApplicable
    }
    
    public init() {
        self.dateAcquired = initialDateAcquired
    }
}

public struct AddNewItemView: View {
    @Binding var form: AddNewItemForm
    
    public var body: some View {
        Form {
            TextField("Name", text: $form.name)
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
            AddNewItemView(form: $form).interactiveDismissDisabled(!form.allowDismiss)
        }
}
