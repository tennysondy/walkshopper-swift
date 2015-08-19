//
//  UserSession.swift
//  walkshopper
//
//  Created by Ding Yi on 15/8/19.
//  Copyright (c) 2015年 Ding Yi. All rights reserved.
//

import UIKit

let _sharedInstance = UserSession()

class UserSession: NSObject {
    class var sharedInstance : UserSession {
        return _sharedInstance
    }
    
    var isLogin = true
}
