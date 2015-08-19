//
//  WSLoginViewController.swift
//  walkshopper
//
//  Created by 丁 一 on 15/8/18.
//  Copyright (c) 2015年 Ding Yi. All rights reserved.
//

import UIKit

class WSLoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录";
        self.loginBtn .addTarget(self, action: "login", forControlEvents: UIControlEvents.TouchUpInside);

    }
    
    func login()
    {
       println("登录")
    }
    
}
