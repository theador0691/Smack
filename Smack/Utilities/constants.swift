//
//  constants.swift
//  Smack
//
//  Created by Andrew Taylor on 12/09/2017.
//  Copyright © 2017 Andrew Taylor. All rights reserved.
//

import Foundation

//renaming a type
//basically saying CompletionHandler is the type of the closure next to it.
//Closure can be passed around in code
//We are going to use it to send off a web request
//When it is done we will pass true or false into that closure.
typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constant
let BASE_URL = "https://chittychatapp.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

//Segues
let TO_LOGIN = "to_Login"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User defaults


let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

