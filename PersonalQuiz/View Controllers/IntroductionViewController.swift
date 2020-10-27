//
//  IntroductionViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 22.10.2020.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    @IBOutlet var startButton: UIButton!
    
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
        startButton.layer.cornerRadius = 10
    }
    

    @IBAction func unwind(segue: UIStoryboardSegue) {}
}
// MARK: - Set background color
extension IntroductionViewController {
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


