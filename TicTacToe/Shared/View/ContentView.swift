//
//  ContentView.swift
//  Shared
//
//  Created by Matvey Garbuzov on 13.03.2022.
//

import SwiftUI

//struct ContentView: View {
//    @StateObject var ticTacToeModel = TicTacToeModel()
//    @State var gameOver : Bool = false
//    @State var gameModeWithBot: Bool = true
//
//    func buttonAction(_ index : Int) {
//        _ = self.ticTacToeModel.makeMove(index: index, player: .home)
//        self.gameOver = self.ticTacToeModel.gameOver.1
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink(destination: SettingsView(choice: "asd")) {
//                    Text("AFS")
//                }
//                ForEach(0 ..< ticTacToeModel.squares.count / 3, content: {
//                    row in
//                    HStack {
//                        ForEach(0 ..< 3, content: {
//                            column in
//                            let index = row * 3 + column
//                            SquareView(dataSource: ticTacToeModel.squares[index], action: {self.buttonAction(index)})
//                        })
//                    }
//                })
//            }.alert(isPresented: self.$gameOver, content: {
//                Alert(title: Text("Game Over"),
//                      message: Text(self.ticTacToeModel.gameOver.0 != .empty ? self.ticTacToeModel.gameOver.0 == .home ? "You Win!": "AI Wins!" : "Nobody Wins" ) , dismissButton: Alert.Button.destructive(Text("Ok"), action: {
//                        self.ticTacToeModel.resetGame()
//                      }))
//            })
//                .navigationBarTitle("Tic Tac Toe")
//                .navigationBarItems(
//                        leading: Button(action: {
//                            print("Settings button pressed...")
//                        }) {
//                            Image(systemName: "gearshape.fill").imageScale(.large)
//                        },
//                        trailing: Button(action: {
//                            print("Questionmark button pressed...")
//                        }) {
//                            Image(systemName: "questionmark.circle.fill").imageScale(.large)
//                        }
//                )
//        }
//
//    }
//}

struct ConnectFourView: View {
    var body: some View {
        NavigationView {
            Text("Hello World!")
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: TicTacToeView()) {
                    Text("Tic Tac Toe").bold()
                        .padding(10)
                        .foregroundColor(Color.white)
                        .opacity(0.8)
                        .font(.system(size: 30))
                }
                NavigationLink(destination: ConnectFourView()) {
                    Text("Connect four").bold()
                        .padding(10)
                        .foregroundColor(Color.white)
                        .opacity(0.8)
                        .font(.system(size: 30))
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
            .background(Color.gray).ignoresSafeArea()
            .navigationBarTitle("Choose the game")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
