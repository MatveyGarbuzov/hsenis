//
//  ColorPickerModel.swift
//  TicTacToe
//
//  Created by Matvey Garbuzov on 15.03.2022.
//

import Foundation
import SwiftUI

final class ColorPickerModel: ObservableObject {
    @Published var selectedColor: String = "Dark"
}
