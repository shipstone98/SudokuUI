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
                ControlButton("1", isActive: self.viewModel.state.value == 1) {
                    self.viewModel.setControlValue(1)
                }
                
                ControlButton("2", isActive: self.viewModel.state.value == 2) {
                    self.viewModel.setControlValue(2)
                }
                
                ControlButton("3", isActive: self.viewModel.state.value == 3) {
                    self.viewModel.setControlValue(3)
                }
                
                ControlButton(
                    "Clear",
                    isActive: self.viewModel.state.isClearSelected
                ) {
                    self.viewModel.setControlClear()
                }
            }
            
            HStack {
                ControlButton("4", isActive: self.viewModel.state.value == 4) {
                    self.viewModel.setControlValue(4)
                }
                
                ControlButton("5", isActive: self.viewModel.state.value == 5) {
                    self.viewModel.setControlValue(5)
                }
                
                ControlButton("6", isActive: self.viewModel.state.value == 6) {
                    self.viewModel.setControlValue(6)
                }
                
                ControlButton(
                    "Notes",
                    isActive: self.viewModel.state.isNotesSelected
                ) {
                    self.viewModel.setControlNotes()
                }
            }
            
            HStack {
                ControlButton("7", isActive: self.viewModel.state.value == 7) {
                    self.viewModel.setControlValue(7)
                }
                
                ControlButton("8", isActive: self.viewModel.state.value == 8) {
                    self.viewModel.setControlValue(8)
                }
                
                ControlButton("9", isActive: self.viewModel.state.value == 9) {
                    self.viewModel.setControlValue(9)
                }
                
                ControlButton("Undo") {
                    self.viewModel.undo()
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    private var viewModel: ContentViewModel
    
    internal init(_ viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    ControlView(.init())
}
