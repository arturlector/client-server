//
//  StepCounterViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 11.06.2021.
//

import UIKit
import RealmSwift

class StepCounterViewController: UIViewController {
    
    @IBOutlet weak var stepLabel: UILabel!
    
    let stepCounter = StepCounter()
    
    let realm = try! Realm()
    
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        try? realm.write {
            realm.add(stepCounter)
        }
        
        token = stepCounter.observe { [weak self] changes in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.stepLabel.text = "Steps: \(self.stepCounter.steps)"
            }
        }
        
    }
    
    @IBAction func stepUpAction(_ sender: Any) {
        
        try? realm.write {
            stepCounter.steps = stepCounter.steps + 1
        }
    }
    

}
