//
//  ExitButtonView.swift
//  HoardMap.SharedUI
//
//  Created by Theodor Gheghea on 09.01.2026.
// Inspired by https://github.com/joogps/ExitButton

import SwiftUI

public struct ExitButtonView: View {
    @Environment(\.colorScheme) public var colorScheme
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(Color(white: colorScheme == .dark ? 0.19 : 0.93))
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .font(Font.body.weight(.bold))
                .scaleEffect(0.416)
                .foregroundColor(Color(white: colorScheme == .dark ? 0.62 : 0.51))
        }
        .frame(width: 40, height: 40)
    }
    
    public init() {
        
    }
}

#Preview {
    ExitButtonView()
}
