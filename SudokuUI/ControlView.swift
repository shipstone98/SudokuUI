//
//  ControlView.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 03/03/2026.
//

import SwiftUI

internal struct ControlView : View {
    @Binding
    private var control: Control
    
    private let colorActive: Color
    private let colorInactive: Color
    
    internal var body: some View {
        VStack {
            HStack {
                ForEach(1..<4) {
                    number in
                    let text = String(number)
                    
                    ControlButton(
                        text,
                        isActive: self.control.number == number,
                        self.colorActive,
                        self.colorInactive
                    ) {
                        self.control.number = number
                    }
                }
                
                ControlButton(
                    "Clear",
                    isActive: self.control.number == 0,
                    self.colorActive,
                    self.colorInactive
                ) {
                    self.control.number = 0
                }
            }
            
            HStack {
                ForEach(4..<7) {
                    number in
                    let text = String(number)
                    
                    ControlButton(
                        text,
                        isActive: self.control.number == number,
                        self.colorActive,
                        self.colorInactive
                    ) {
                        self.control.number = number
                    }
                }
                
                ControlButton(
                    "Notes",
                    isActive: self.control.isNotesSelected,
                    self.colorActive,
                    self.colorInactive
                ) {
                    self.control.isNotesSelected.toggle()
                }
            }
            
            HStack {
                ForEach(7..<10) {
                    number in
                    let text = String(number)
                    
                    ControlButton(
                        text,
                        isActive: self.control.number == number,
                        self.colorActive,
                        self.colorInactive
                    ) {
                        self.control.number = number
                    }
                }
                
                ControlButton(
                    "Undo",
                    isActive: false,
                    self.colorActive,
                    self.colorInactive
                )
            }
        }
    }
    
    internal init(_ control: Binding<Control>) {
        self._control = control
        self.colorActive = .blue
        self.colorInactive = .gray
    }
}

#Preview {
    ControlView(.constant(.init()))
}
