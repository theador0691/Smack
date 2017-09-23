//
//  UserDataService.swift
//  Smack
//
//  Created by Andrew Taylor on 17/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor{
        
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r,g,b,a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)

        let defaultColor = UIColor.lightGray
        
        guard let rUnrwapped = r else { return defaultColor }
        guard let gUnrwapped = g else { return defaultColor }
        guard let bUnrwapped = b else { return defaultColor }
        guard let aUnrwapped = a else { return defaultColor }

        let rFloat = CGFloat(rUnrwapped.doubleValue)
        let gFloat = CGFloat(gUnrwapped.doubleValue)
        let bFloat = CGFloat(bUnrwapped.doubleValue)
        let aFloat = CGFloat(aUnrwapped.doubleValue)

        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newUIColor
    }
    
    
    func logOutUsers() {
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToekn = ""
    }
    
}
