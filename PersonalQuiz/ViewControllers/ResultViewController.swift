//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var resultTitle: UILabel!
    @IBOutlet var resultInfo: UILabel!
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    
    var resultAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getResult() {
        var answerAnimalCount: [Animal : Int] = [:]
        let onlyAnimalAnswers = resultAnswers.map { $0.animal }
        
        for animal in onlyAnimalAnswers {
            answerAnimalCount[animal] = (answerAnimalCount[animal] ?? 0 ) + 1
        }
        
        let sortedAnswers = answerAnimalCount.sorted { $0.value > $1.value}
        guard let mostCommonAnimal = sortedAnswers.first?.key else { return }
        
        resultTitle.text = "Вы \(mostCommonAnimal.rawValue)"
        resultInfo.text = mostCommonAnimal.definition
    }
}
