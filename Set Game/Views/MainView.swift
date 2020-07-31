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
        GeometryReader { geometry in
            NavigationView {
                self.body(for: geometry.size)
            }
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        VStack {
            Grid(self.viewModel.tableCards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation {
                        self.viewModel.choose(card: card)
                    }
                }.transition(AnyTransition.offset(self.randomPoint(for: size)))
            }
            
            HStack(alignment: .center) {
                Button(action: {
                    withAnimation {
                          self.viewModel.pushAdditionCards()
                    }
                }) {
                    Text("Add 3 cards")
                }.disabled(!self.viewModel.allowForPushing)
                Spacer()
                Text("Score: \(self.viewModel.score)")
            }
        }
        .navigationBarTitle("Set Game", displayMode: .inline)
        .navigationBarItems(trailing: Button (action: {
            withAnimation {
                self.viewModel.startGame()
            }
        }) {
            Image(systemName: "plus")
        })
        .padding()
        .onAppear {
            withAnimation {
                self.viewModel.startGame()
            }
        }
    }
    
    private func randomPoint(for size: CGSize) -> CGSize {
        let width = CGFloat.random(
            in:  Bool.random() ? ((size.width+minOffset)...(size.width+maxOffset)) : (-maxOffset...(-minOffset))
        )
        let height = CGFloat.random(
            in:  Bool.random() ? ((size.height+minOffset)...(size.height+maxOffset)) : (-maxOffset...(-minOffset))
        )
        return CGSize(width: width, height: height)
    }
    private let minOffset: CGFloat = 300
    private let maxOffset: CGFloat = 500
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: SetGameViewModel())
    }
}
