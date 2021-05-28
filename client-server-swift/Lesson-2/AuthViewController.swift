//
//  AuthViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 24.05.2021.
//

import UIKit
import WebKit

final class Session {
    static let shared = Session()
    
    private init() {}
    
    var token = ""
}

class AuthViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let token = UserDefaults.standard.string(forKey: "vkToken") {
            
            Session.shared.token = token
            
            self.navigationController?.pushViewController(NetworkViewController(), animated: true)
        }
        
        //NSKeyedArchiver
        
        //Переход в следующий экран
        
        //Строим URL c параметрами
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7862788"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment  else {
                    decisionHandler(.allow)
                    return
            }
        
        let params = fragment
                    .components(separatedBy: "&")
                    .map { $0.components(separatedBy: "=") }
                    .reduce([String: String]()) { result, param in
                        var dict = result
                        let key = param[0]
                        let value = param[1]
                        dict[key] = value
                        return dict
                }
        
        let token = params["access_token"]
        
        print("TOKEN")
        print(token as Any)
        
        if let token = token, !token.isEmpty {
            UserDefaults.standard.setValue(token, forKey: "vkToken")
            
            //Переход в следущий контроллер
        }
        
        
        decisionHandler(.cancel)
    }
}
