//
//  AuthService.swift
//  Smack
//
//  Created by Andrew Taylor on 15/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
        
      
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
                //hard JSON way
//                if let json = response.result.value as? Dictionary<String, Any> {
//                    if let email = json["user"] as? String {
//                        self.userEmail = email
//                    }
//                    if let token = json["token"] as? String {
//                        self.authToekn = token
//                    }
//                }
//
                //using SWIFTY JSON
                guard let data = response.data else { return }
                let json = JSON(data: data)
                //.string value safely unwraps the value for us!
                self.userEmail = json["user"].stringValue
                self.authToekn = json["token"].stringValue
                
                self.isLoggedIn = true
                completion(true)
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, complition: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName" : avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToekn)",
            "Content-Type": "application/JSON; character=utf-8"
        ]
        
        Alamofire.request(URL_ADD_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                let json = JSON(data: data)
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                
                UserDataService.instance.setUserData(id: id, avatarColor: color, avatarName: avatarName, email: email, name: name)
                complition(true)
                
            }else {
                complition(false)
                print(response.result.error as Any)
            }
        }
        
        
    }
    
    
}
