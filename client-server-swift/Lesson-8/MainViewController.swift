//
//  MainViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 14.06.2021.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    private var cities = [FBCity]()
    
    private let ref = Database.database().reference(withPath: "cities") //создали контейнер для массива городов

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.observe(.value, with: { snapshot in
            var cities: [FBCity] = []
            
            // 2
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let city = FBCity(snapshot: snapshot) {
                    cities.append(city)
                }
            }
            
            // 3
            self.cities = cities
            cities.forEach {
                print($0.name, $0.zipcode)
            }
       })

    }
    
    private func showLoginScreen() {
        guard let vc = storyboard?.instantiateViewController(identifier: "Login"),
              let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        
        try? Auth.auth().signOut()
        showLoginScreen()
    }
    
    @IBAction func addCityAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Enter city", message: nil, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let save = UIAlertAction(title: "Save City", style: .default) { _ in
            
            guard let textField = alert.textFields?.first,
                  let cityName = textField.text else { return }
            
            //Создаем модель
            let city = FBCity(name: cityName, zipcode: Int.random(in: 100000...999999))
            
            //Создаем ссылку на город внутри Firebase (контейнер для конкретного города)
            let cityRef = self.ref.child(cityName.lowercased())
            
            //Сохраняем dict в контейнер города
            cityRef.setValue(city.toAnyObject())
        }
        
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(save)
        
        present(alert, animated: true, completion: nil)
        
    }
}
