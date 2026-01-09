//
//  TopLabeledTextField.swift
//  HoardMap.SharedUI
//
//  Created by Theodor Gheghea on 08.01.2026.
//  Inspired by https://mic.st/blog/labeled-textfield-in-swiftui/

import SwiftUI

struct TopLabeledStyleConfig: LabeledContentStyle {

    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.callout)
            configuration.content
        }
    }

}

public struct TopLabeledTextField: View {

    @Binding var text: String
    var label: String

    public var body: some View {
        LabeledContent {
            TextField("", text: $text)
                .textFieldStyle(.roundedBorder)
        } label: {
            Text(label)
        }
        .labeledContentStyle(TopLabeledStyleConfig())
    }
    
    public init(_ label: String, text: Binding<String>) {
        self.label = label
        self._text = text
    }
}

#Preview {
    Form {
        TopLabeledTextField("Lorem ipsum", text: .constant(""))
    }
}
