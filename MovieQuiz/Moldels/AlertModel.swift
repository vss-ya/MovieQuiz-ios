//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by vs on 13.11.2023.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    var accessibilityIdentifier: String = "Game results"
}
