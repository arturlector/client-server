//
//  ObserverViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 21.05.2021.
//

import UIKit

//Покупатель
class Buyer {
    func takeInfo() {
        print("Покупатель получает уведомление о том что товар появился")
    }
}

//Контейнер - который слабую ссылку на покупателя
struct WeakBuyer {
    weak var buyer: Buyer?
}

class Shop {
    
    //слушатели/подписки
    var listeners = [WeakBuyer]()
    
    //подписывает
    func subscribe(buyer: Buyer) {
        let weakBuyer = WeakBuyer(buyer: buyer)
        listeners.append(weakBuyer)
    }
    
    //оповещает
    func notify() {
        listeners.forEach { $0.buyer?.takeInfo() }
    }
}

class ObserverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shop = Shop()
        
        let buyer1 = Buyer()
        let buyer2 = Buyer()
        let buyer3 = Buyer()

        shop.subscribe(buyer: buyer1)
        shop.subscribe(buyer: buyer2)
        
        //Товар появился на складе/прилавке
        shop.notify()
    }

}
