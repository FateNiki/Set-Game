//
//  ContentView.swift
//  Set Game
//
//  Created by Алексей Никитин on 30.07.2020.
//  Copyright © 2020 Aleksey Nikitin. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: SetGameViewModel
    
    var body: some View {
        VStack {
            Grid(viewModel.tableCards) { _ in
                RoundedRectangle(cornerRadius: 3).fill()
            }
            Button(action: {
                self.viewModel.startGame()
            }) {
                Text("New Game")
            }
        }.padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: SetGameViewModel())
    }
}
