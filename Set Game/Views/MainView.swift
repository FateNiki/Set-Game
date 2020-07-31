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
        NavigationView {
            VStack {
                Grid(viewModel.tableCards) { card in
                    CardView(card: card)
                }
                
                HStack {
                    Button(action: {
                        self.viewModel.startGame()
                    }) {
                        Text("Add 3 cards")
                    }
                    Spacer()
                    Button(action: {}) {
                        Text("Set")
                    }.disabled(true)
                }
            }
            .navigationBarTitle("Set Game", displayMode: .inline)
            .navigationBarItems(trailing: Button (action: {
                self.viewModel.startGame()
            }) {
                Image(systemName: "plus")
            })
            .padding()
            .onAppear {
                self.viewModel.startGame()
            }
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: SetGameViewModel())
    }
}
