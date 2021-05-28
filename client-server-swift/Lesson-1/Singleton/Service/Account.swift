//
//  Account.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 21.05.2021.
//

import Foundation

final class AccountService {
    
    private init () {}
    
    static let shared = AccountService()
    
    var name: String = ""
    var cash: Int = 0
}
