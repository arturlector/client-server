//
//  AccountViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 21.05.2021.
//

import UIKit

class AccountViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func transferAction(_ sender: Any) {
        
        guard let name = nameTextField.text,
              let cashString = cashTextField.text,
              let cash = Int(cashString)
        else {
            return
        }
        
        AccountService.shared.name = name
        AccountService.shared.cash = cash
        
    }
    
}
