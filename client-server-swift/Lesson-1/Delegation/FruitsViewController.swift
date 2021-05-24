//
//  FruitsViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 21.05.2021.
//

import UIKit

protocol FruitsViewControllerDelegate: AnyObject {
    
    func fruitDidSelect(_ fruit: String)
}

//Делегирующий объект
class FruitsViewController: UITableViewController {

    weak var delegate: FruitsViewControllerDelegate?
    
    let fruits = ["Яблоко", "Банан", "Киви", "Авокадо"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - UITableViewDatasource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        
        return cell
    }
    
    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fruit = fruits[indexPath.row]
        
        delegate?.fruitDidSelect(fruit)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
  

}
