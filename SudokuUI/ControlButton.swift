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
        Button(action: self.action) {
            Text(self.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(self.isActive ? .blue : .gray)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
    
    private let isActive: Bool
    private let title: String
    
    internal init(
        _ title: String,
        isActive: Bool = false,
        action: @escaping () -> Void = { }
    ) {
        self.action = action
        self.isActive = isActive
        self.title = title
    }
}
