//
//  ContentView.swift
//  SudokuUI
//
//  Created by Christopher Shipstone on 31/03/2026.
//

import SwiftUI
import SwiftUIUtilities

internal struct ContentView : View {
    internal var body: some View {
        VStack {
            SudokuView(self.viewModel.sudoku, self.$viewModel.selection)
        }
        .padding()
    }
    
    @State
    private var viewModel: ContentViewModel
    
    internal init() {
        self.viewModel = .init()
    }
}

#Preview {
    ContentView()
}
