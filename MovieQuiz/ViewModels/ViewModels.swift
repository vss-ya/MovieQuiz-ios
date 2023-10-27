//
//  ViewModels.swift
//  MovieQuiz
//
//  Created by vs on 27.10.2023.
//

import UIKit

// для состояния "Вопрос показан"
struct QuizStepViewModel {
  let image: UIImage
  let question: String
  let questionNumber: String
}

// для состояния "Результат квиза"
struct QuizResultsViewModel {
  let title: String
  let text: String
  let buttonText: String
}
