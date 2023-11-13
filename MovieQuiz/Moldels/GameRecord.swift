//
//  GameRecord.swift
//  MovieQuiz
//
//  Created by vs on 17.11.2023.
//

import Foundation

struct GameRecord: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    var description: String {
        "\(correct)/\(total) (\(date.dateTimeString))"
    }
    
    func isBetterThan(_ another: GameRecord) -> Bool {
        correct > another.correct
    }
}
