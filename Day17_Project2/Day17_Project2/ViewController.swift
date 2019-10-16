//
//  ViewController.swift
//  Day17_Project2
//
//  Created by Renoy on 15/10/2019.
//  Copyright © 2019 Renoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestionsAsked = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        
        btn1.layer.borderColor = UIColor.gray.cgColor
        btn2.layer.borderColor = UIColor.gray.cgColor
        btn3.layer.borderColor = UIColor.gray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction? = nil) {
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        btn1.setImage(UIImage(named: countries[0]), for: .normal)
        btn2.setImage(UIImage(named: countries[1]), for: .normal)
        btn3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()), Score: \(score)"
    }
    
    // MARK: - IBAction
    @IBAction func btn1Tapped(_ sender: UIButton) {
        var title: String
        var message: String
        if sender.tag == correctAnswer {
            score += 1
            title = "Correct"
            message = "Your score is \(score)"
        } else {
            score -= 1
            title = "Wrong"
            message = "The correct aswer is \(countries[correctAnswer].uppercased())"
            
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (alert) in
            if self.numberOfQuestionsAsked == 10 {
                let alert = UIAlertController(title: "You have aswered 10 Questions", message: "your score is \(self.score)/\(self.numberOfQuestionsAsked)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: self.askQuestion))
                self.present(alert, animated: true)
                self.numberOfQuestionsAsked = 0
                self.score = 0
            } else {
                self.numberOfQuestionsAsked += 1
                self.askQuestion(action: alert)
            }
        }))
        
        present(ac, animated: true)
    }
}

