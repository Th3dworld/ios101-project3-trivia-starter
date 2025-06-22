//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Matanda  Phiri  on 6/21/25.
//

import UIKit

class TriviaViewController: UIViewController {
    
    @IBOutlet weak var QuestionView: UIView!
    @IBOutlet weak var QuestionProgressLabel: UILabel!
    @IBOutlet weak var QuestionCategoryLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var Option1Label: UIButton!
    @IBOutlet weak var Option2Label: UIButton!
    @IBOutlet weak var Option3Label: UIButton!
    @IBOutlet weak var Option4Label: UIButton!
    
    @IBAction func DidTapOption1(_ sender: Any) {
        updateProgress(with: questionBank, sender: Option1Label)
        configure(with: questionBank)
    }
    
    @IBAction func DidTapOption2(_ sender: Any) {
        updateProgress(with: questionBank, sender: Option2Label)
        configure(with: questionBank)
    }
    
    
    @IBAction func DidTapOption3(_ sender: Any) {
        updateProgress(with: questionBank, sender: Option3Label)
        configure(with: questionBank)
    }
    
    
    @IBAction func DidTapOption4(_ sender: Any) {
        updateProgress(with: questionBank, sender: Option4Label)
        configure(with: questionBank)
    }
    
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    let questionBank: [QuestionData] = [
        QuestionData(
            question: "What is the chemical symbol for water?",
            category: "Science",
            option1: "O2",
            option2: "H2O",
            option3: "CO2",
            option4: "HO",
            answer: "H2O"
        ),
        QuestionData(
            question: "Which continent is the Sahara Desert located on?",
            category: "Geography",
            option1: "Asia",
            option2: "Africa",
            option3: "Australia",
            option4: "South America",
            answer: "Africa"
        ),
        QuestionData(
            question: "Who painted the Mona Lisa?",
            category: "Art",
            option1: "Pablo Picasso",
            option2: "Vincent van Gogh",
            option3: "Leonardo da Vinci",
            option4: "Claude Monet",
            answer: "Leonardo da Vinci"
        ),
        QuestionData(
            question: "What is the largest planet in our solar system?",
            category: "Astronomy",
            option1: "Saturn",
            option2: "Earth",
            option3: "Jupiter",
            option4: "Neptune",
            answer: "Jupiter"
        )
    ]
    
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuestionView.layer.cornerRadius = 5
        configure(with: questionBank)
    }
    
    private func configure(with questions: [QuestionData]){
        if currentQuestionIndex < questions.count{
            QuestionProgressLabel.text = "Question \(currentQuestionIndex + 1)/\(questions.count)"
            QuestionCategoryLabel.text = questions[currentQuestionIndex].category
            QuestionLabel.text = questions[currentQuestionIndex].question
            Option1Label.setTitle(questions[currentQuestionIndex].option1, for: .normal)
            Option2Label.setTitle(questions[currentQuestionIndex].option2, for: .normal)
            Option3Label.setTitle(questions[currentQuestionIndex].option3, for: .normal)
            Option4Label.setTitle(questions[currentQuestionIndex].option4, for: .normal)
        }else{
            guard let destinationVC = mainStoryboard.instantiateViewController(withIdentifier: "RestartViewController") as? RestartViewController else { return }
            destinationVC.modalPresentationStyle = .overFullScreen
            present(destinationVC, animated: true, completion: nil)
            destinationVC.FinalScoreLabel.text = "Final Score:\(score)/\(questions.count)"
            currentQuestionIndex = 0
            configure(with: questionBank)
        }
    }
    
    private func updateProgress(with questions: [QuestionData], sender: UIButton){
        if sender.currentTitle == questions[currentQuestionIndex].answer{
            score += 1
        }
        
        if currentQuestionIndex < questions.count{
            currentQuestionIndex += 1
        }
    }
    
}
