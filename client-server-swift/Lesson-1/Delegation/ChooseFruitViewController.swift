//
//  MainViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 21.05.2021.
//

import UIKit

class ChooseFruitViewController: UIViewController, FruitsViewControllerDelegate {
    
    @IBOutlet weak var fruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - FruitsViewControllerDelegate
    
    func fruitDidSelect(_ fruit: String) {
        
        self.fruitLabel.text = fruit
    }
    
    
    @IBAction func showFruitsViewController(_ sender: Any) {
        
        let fruitsController = FruitsViewController()
        
        //Обозначаем делегатом текущий контроллером - ChooseFruitViewController
        //Делегирующий объект - FruitsViewController
        fruitsController.delegate = self
        
        self.navigationController?.pushViewController(fruitsController, animated: true)
    }
    


}
