//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    var answers: [Answer] = []
    
    
    @IBOutlet weak var resultIconLabel: UILabel!
    
    @IBOutlet weak var resultTextResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        displayMostFrequentAnimal()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func displayMostFrequentAnimal() {
           // Создаем словарь для подсчета количества каждого животного
           var animalCounts: [Animal: Int] = [:]
           for answer in answers {
               animalCounts[answer.animal, default: 0] += 1
           }

           
           if let (mostFrequentAnimal, count) = animalCounts.max(by: { $0.value < $1.value }) {
               resultIconLabel.text = "Вы -  \(mostFrequentAnimal.rawValue)"
               print("Самое частое животное: \(mostFrequentAnimal.rawValue) — \(count) раз(а)")
               resultTextResult.text = mostFrequentAnimal.definition
               print("Описание: \(mostFrequentAnimal.definition)")
           } else {
               print("Нет данных для анализа.")
           }
       }
}
