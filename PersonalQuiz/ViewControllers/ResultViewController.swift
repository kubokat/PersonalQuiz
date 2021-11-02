//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    var results: [AnimalType: Int] = [:]
    
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true);
        
        getResult()
        
        let animalKey = results.max { $0.value < $1.value}?.key
        
        guard let animalIcon = animalKey?.rawValue else { return }
        guard let animalName = animalKey?.name else { return }
        
        typeLabel.text = "\(animalName) - \(String(animalIcon))"
        
        guard let definition = animalKey?.definition else { return }
        descriptionLabel.text = definition
        
    }
    
    private func getResult() {
        for answer in answers {
            if let currentResult = results[answer.type] {
                results[answer.type] = currentResult + 1
            } else {
                results[answer.type] = 1
            }
        }
    }
    

    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
}
