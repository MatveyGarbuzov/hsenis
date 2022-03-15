//
//  SquareView.swift
//  TicTacToe
//
//  Created by Matvey Garbuzov on 14.03.2022.
//

import Foundation
import SwiftUI

enum SquareStatus {
    case empty
    case home
    case visitor
}

class Square : ObservableObject {
    @Published var squareStatus : SquareStatus
    
    init(status : SquareStatus) {
        self.squareStatus = status
    }
}

struct SquareView : View {
    @ObservedObject var dataSource : Square
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(self.dataSource.squareStatus == .home ?
                    "X" : self.dataSource.squareStatus == .visitor ? "0" : " ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .frame(width: 75, height: 75, alignment: .center)
                .background(Color(red: 93/252, green: 93/255, blue: 93/255).cornerRadius(10))
                .padding(4)
        })
    }
}
