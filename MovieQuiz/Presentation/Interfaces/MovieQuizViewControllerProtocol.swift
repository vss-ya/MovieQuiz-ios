//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by vs on 12.12.2023.
//

protocol MovieQuizViewControllerProtocol: AnyObject {
    func show(step: QuizStepViewModel)
    func show(results: QuizResultsViewModel)
    
    func highlightImageBorder(isCorrectAnswer: Bool)
    
    func hideLoadingIndicator()
    func showLoadingIndicator()
    
    func disableButtons()
    func enableButtons()
    
    func showNetworkError(message: String)
}
