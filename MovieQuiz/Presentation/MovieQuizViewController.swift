import UIKit

final class MovieQuizViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var buttonsStack: UIStackView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    private var presenter: MovieQuizPresenter!
    private var alertPresenter: AlertPresenter!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MovieQuizPresenter(viewController: self)
        alertPresenter = AlertPresenter(viewController: self)
    }
    
    // MARK: - Actions
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        presenter.yesButtonClicked()
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.noButtonClicked()
    }
    
}

extension MovieQuizViewController: MovieQuizViewControllerProtocol {
    
    func show(step: QuizStepViewModel) {
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    func show(results: QuizResultsViewModel) {
        let alert = AlertModel(title: results.title,
                               message: results.text,
                               buttonText: results.buttonText)
        alertPresenter.show(alert) { [weak self] in
            guard let self else {
                return
            }
            self.presenter.restartGame()
        }
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    
    func hideLoadingIndicator() {
        enableButtons()
        activityIndicator.stopAnimating()
    }
    
    func showLoadingIndicator() {
        disableButtons()
        activityIndicator.startAnimating()
    }
    
    func disableButtons() {
        buttonsStack.arrangedSubviews.forEach {
            ($0 as? UIButton)?.isEnabled = false
        }
    }
    
    func enableButtons() {
        buttonsStack.arrangedSubviews.forEach {
            ($0 as? UIButton)?.isEnabled = true
        }
    }
    
    func showNetworkError(message: String) {
        let alert = AlertModel(title: "Ошибка",
                               message: message,
                               buttonText: "Попробовать ещё раз")
        alertPresenter.show(alert) { [weak self] in
            guard let self else {
                return
            }
            self.presenter.reloadGame()
        }
    }
    
}
