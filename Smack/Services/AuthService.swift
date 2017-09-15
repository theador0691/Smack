//
//  AuthService.swift
//  Smack
//
//  Created by Andrew Taylor on 15/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    //only to allow one instance of it at a time
    static let instance = AuthService()
    
    //easiest way of saving data in the app!
    // use it for String and Bools, not passwords though!
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToekn: String {
        get{
            //value is an optional any so needs to be cast as string
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set{
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get{
            //value is an optional any so needs to be cast as string
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set{
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUsers(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let header = [
            "Content-Type": "application/JSON; character=utf-8"
        ]
        
        let body: [String: Any?] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
        
    }
    
    
    
    
    
    
}
