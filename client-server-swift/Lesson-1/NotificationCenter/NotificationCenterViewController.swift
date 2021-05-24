//
//  NotificationCenterViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 21.05.2021.
//

import UIKit

class NotificationCenterViewController: UIViewController {
    
    let backgoundChangeColorNotification = Notification.Name("backgoundChangeColorNotification")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeColor(notification:)),
                                               name: backgoundChangeColorNotification,
                                               object: nil)
    }
    
    @objc
    func changeColor(notification: Notification) {
        
        guard let color = notification.userInfo?["color"] as? UIColor else {
            return
        }
        
        view.backgroundColor = color
    }
    
    @IBAction func changeColorAction(_ sender: Any) {
        let color = UIColor.yellow
        NotificationCenter.default.post(name: backgoundChangeColorNotification, object: nil, userInfo: ["color": color])
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: backgoundChangeColorNotification, object: nil)
    }
    
}
