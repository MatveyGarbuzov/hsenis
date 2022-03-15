//
//  TicTacToeView.swift
//  TicTacToe
//
//  Created by Matvey Garbuzov on 15.03.2022.
//

import Foundation
import SwiftUI

struct customColors {
//    static let dark =
}

struct TicTacToeView: View {
    @StateObject var ticTacToeModel = TicTacToeModel()
    
    @State var gameOver : Bool = false
    @State var gameModeWithBot: Bool = true
    @State var showSettingsView: Bool = false
    @State var showQuestionView: Bool = false
    @State private var angle: Double = 0
    
    var myScore = 0
    
    @ObservedObject var selectedColor = ColorPickerModel()
    @ObservedObject var score = ScoreModel()
    
    func buttonAction(_ index : Int) {
        _ = self.ticTacToeModel.makeMove(index: index, player: .home)
        self.gameOver = self.ticTacToeModel.gameOver.1
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Theme: \(selectedColor.selectedColor)").foregroundColor(Color.white)
                Text("Your score: \(score.homeScore)").foregroundColor(Color.white)
                Text("Bot score: \(score.visitorScore)").foregroundColor(Color.white)

                ForEach(0 ..< ticTacToeModel.squares.count / 3, content: { row in
                    HStack {
                        ForEach(0 ..< 3, content: { column in
                            let index = row * 3 + column
                            SquareView(
                                dataSource: ticTacToeModel.squares[index],
                                action: { self.buttonAction(index) }
                            )
                        })
                    }
                })
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
            .background(Color(red: 48/255, green: 49/255, blue: 48/255)).ignoresSafeArea()
            .alert(isPresented: self.$gameOver, content: {
                Alert(
                    title: Text("Game Over"),
                    message: Text(self.ticTacToeModel.gameOver.0 != .empty ? self.ticTacToeModel.gameOver.0 == .home ? "You Win!": "AI Wins!" : "Nobody Wins"),
                    dismissButton: Alert.Button.destructive(Text("Ok"), action: {
                        if (self.ticTacToeModel.gameOver.0 != .empty && self.ticTacToeModel.gameOver.0 == .home) {
                            print("you win")
                            score.homeScore += 1
                        } else if (self.ticTacToeModel.gameOver.0 != .empty && self.ticTacToeModel.gameOver.0 == .visitor) {
                            print("visitor win")
                            score.visitorScore += 1
                        }
                        self.ticTacToeModel.resetGame()
                    }))
            })
            .navigationBarTitle("Tic Tac Toe")
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        print("Settings button pressed.")
                        self.showSettingsView.toggle()
                    }) {
                        Image(systemName: "gearshape.fill").imageScale(.large).foregroundColor(.white)
                    }
                    Button(action: {
                        print("Reset button pressed.")
                        angle -= 360
                        score.homeScore = 0
                        score.visitorScore = 0
                    }) {
                        Image(systemName: "gobackward").imageScale(.large).foregroundColor(.white)
                    }.rotationEffect(.degrees(angle))
                    .animation(.easeIn, value: angle)
                }
                ,
                trailing: Button(action: {
                    print("Questionmark button pressed.")
                    self.showQuestionView.toggle()
                }) {
                    Image(systemName: "questionmark.circle.fill").imageScale(.large).foregroundColor(.white)
                }
            )
        }.sheet(isPresented: $showSettingsView) {
            SettingsView(selectedColor: self.$selectedColor.selectedColor)
        }.sheet(isPresented: $showQuestionView) {
            QuestionView()
        }
    }
}


/*
 
 .navigationBarItems(
     leading: Button(action: {
         print("Settings button pressed.")
         self.showSettingsView.toggle()
     }) {
         Image(systemName: "gearshape.fill").imageScale(.large).foregroundColor(.white)
     },
     trailing: Button(action: {
         print("Questionmark button pressed.")
         self.showQuestionView.toggle()
     }) {
         Image(systemName: "questionmark.circle.fill").imageScale(.large).foregroundColor(.white)
     }
 )
 
 */
