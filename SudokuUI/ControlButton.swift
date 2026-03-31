//
//  ControlButton.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

import SwiftUI

internal struct ControlButton : View {
    private let action: () -> Void
    
    internal var body: some View {
        Button(self.title, action: self.action)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .background(self.color)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
    
    private let color: Color
    private let title: String
    
    internal init(
        _ title: String,
        color: Color,
        action: @escaping () -> Void = { }
    ) {
        self.action = action
        self.color = color
        self.title = title
    }
}
