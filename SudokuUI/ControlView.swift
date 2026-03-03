//
//  ControlView.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 03/03/2026.
//

import SwiftUI

internal struct ControlView : View {
    private let colorActive: Color
    private let colorInactive: Color
    
    @State
    private var viewModel: ContentViewModel
    
    internal var body: some View {
        VStack {
            HStack {
                ForEach(1..<4) {
                    number in
                    let text = String(number)
                    
                    ControlButton(
                        text,
                        isActive: self.viewModel.control.number == number,
                        self.colorActive,
                        self.colorInactive
                    ) {
                        self.viewModel.control.number = number
                    }
                }
                
                ControlButton(
                    "Clear",
                    isActive: self.viewModel.control.number == 0,
                    self.colorActive,
                    self.colorInactive
                ) {
                    self.viewModel.control.number = 0
                }
            }
            
            HStack {
                ForEach(4..<7) {
                    number in
                    let text = String(number)
                    
                    ControlButton(
                        text,
                        isActive: self.viewModel.control.number == number,
                        self.colorActive,
                        self.colorInactive
                    ) {
                        self.viewModel.control.number = number
                    }
                }
                
                ControlButton(
                    "Notes",
                    isActive: self.viewModel.control.isNotesSelected,
                    self.colorActive,
                    self.colorInactive
                ) {
                    self.viewModel.control.isNotesSelected.toggle()
                }
            }
            
            HStack {
                ForEach(7..<10) {
                    number in
                    let text = String(number)
                    
                    ControlButton(
                        text,
                        isActive: self.viewModel.control.number == number,
                        self.colorActive,
                        self.colorInactive
                    ) {
                        self.viewModel.control.number = number
                    }
                }
                
                ControlButton(
                    "Undo",
                    isActive: false,
                    self.colorActive,
                    self.colorInactive
                ) {
                    self.viewModel.undo()
                }
            }
        }
    }
    
    internal init(_ viewModel: State<ContentViewModel>) {
        self.colorActive = .blue
        self.colorInactive = .gray
        self._viewModel = viewModel
    }
}

#Preview {
    ControlView(.init(initialValue: .init()))
}
