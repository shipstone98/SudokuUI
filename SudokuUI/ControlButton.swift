//
//  ControlButton.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 03/03/2026.
//

import SwiftUI

internal struct ControlButton : View {
    private let action: () -> Void
    private let style: Style
    private let text: String
    
    internal var body: some View {
        Button(self.text) {
            self.action()
        }
        .buttonStyle(self.style)
    }
    
    internal init(
        _ text: String,
        isActive: Bool,
        _ colorActive: Color,
        _ colorInactive: Color,
        action: @escaping () -> Void = { }
    ) {
        self.action = action
        self.style = .init(isActive, colorActive, colorInactive)
        self.text = text
    }
    
    private struct Style : ButtonStyle {
        private let colorActive: Color
        private let colorInactive: Color
        private let isActive: Bool
        
        internal init(
            _ isActive: Bool,
            _ colorActive: Color,
            _ colorInactive: Color
        ) {
            self.colorActive = colorActive
            self.colorInactive = colorInactive
            self.isActive = isActive
        }
        
        fileprivate func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(maxWidth: .infinity)
                .padding()
                .background(self.isActive ? self.colorActive : self.colorInactive)
                .foregroundColor(.white)
                .cornerRadius(8)
                .opacity(configuration.isPressed ? 0.7 : 1.0)
        }
    }
}
