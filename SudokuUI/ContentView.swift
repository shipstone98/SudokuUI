//
//  ContentView.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 03/03/2026.
//

import Sudoku
import SwiftUI
import SwiftUIUtilities

internal struct ContentView : View {
    @State
    private var viewModel: ContentViewModel
    
    internal var body: some View {
        VStack {
            SudokuView(self.$viewModel.sudoku, selection: self.$viewModel.selection)
            Spacer()
            ControlView(self.$viewModel.control)
        }
        .padding()
    }
    
    internal init() {
        self.viewModel = .init()
    }
}

#Preview {
    ContentView()
}
