//
//  ControlView.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

import SwiftUI

internal struct ControlView : View {
    internal var body: some View {
        VStack {
            HStack {
                ControlButton("1", color: self.colorInactive)
                ControlButton("2", color: self.colorInactive)
                ControlButton("3", color: self.colorInactive)
                ControlButton("Clear", color: self.colorInactive)
            }
            
            HStack {
                ControlButton("4", color: self.colorInactive)
                ControlButton("5", color: self.colorInactive)
                ControlButton("6", color: self.colorInactive)
                ControlButton("Notes", color: self.colorInactive)
            }
            
            HStack {
                ControlButton("7", color: self.colorInactive)
                ControlButton("8", color: self.colorInactive)
                ControlButton("9", color: self.colorInactive)
                ControlButton("Undo", color: self.colorInactive)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    private let colorInactive: Color
    
    internal init() {
        self.colorInactive = .gray
    }
}

#Preview {
    ControlView()
}
