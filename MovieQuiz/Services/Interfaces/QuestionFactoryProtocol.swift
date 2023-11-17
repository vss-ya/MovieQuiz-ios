//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by vs on 13.11.2023.
//

import Foundation

protocol QuestionFactoryProtocol {
    
    var delegate: QuestionFactoryDelegate? {get set}
    
    func requestNextQuestion()
    
}
