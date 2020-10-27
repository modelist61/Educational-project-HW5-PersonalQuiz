//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var emojiLable: UILabel!
    @IBOutlet var descriptionLable: UILabel!
    
    var answerChoosen: [Answer] = []
    
    // MARK: - Private properties
    private let primaryColor = UIColor(
        red: 0.0/255.0,
        green: 181.0/255.0,
        blue: 220.0/255.0,
        alpha: 1.0
    )
    private let secondaryColor = UIColor(
        red: 156.0/255.0,
        green: 208.0/255.0,
        blue: 220.0/255.0,
        alpha: 1
    )
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        self.navigationItem.setHidesBackButton(true, animated: true)
        emojiLable.text = "Вы - \(mostPopylarAnswers().rawValue)!"
        descriptionLable.text = "\(mostPopylarAnswers().definition)"
    }
    
    private func mostPopylarAnswers() -> AnimalType {
        var sortedAnswers: [AnimalType: Int] = [.rabbit: 0,
                                                .cat: 0,
                                                .dog: 0,
                                                .turtle: 0]
        for animal in answerChoosen {
            switch animal.type {
            case .rabbit :
                sortedAnswers[.rabbit]! += 1
            case .cat:
                sortedAnswers[.cat]! += 1
            case .dog:
                sortedAnswers[.dog]! += 1
            case .turtle:
                sortedAnswers[.turtle]! += 1
            }
        }
        let currentAnswer = sortedAnswers.sorted{ $0.1 < $1.1 }.last?.key
        return currentAnswer!
    }
}

// MARK: - Set background color
extension ResultsViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
