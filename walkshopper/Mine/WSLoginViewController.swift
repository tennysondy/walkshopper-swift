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
        var backBtn : UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        backBtn.frame = CGRectMake(0, 0, 40, 40)
        backBtn.setTitle("返回", forState: .Normal)
        backBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        backBtn.addTarget(self, action: "backBtnTapped", forControlEvents: .TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        self.loginBtn .addTarget(self, action: "login", forControlEvents: .TouchUpInside);
    }
    
    func backBtnTapped()
    {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func login()
    {
        var url = NSURL(string: "walkshopper://user/view/joeldev")
        UIApplication.sharedApplication().openURL(url!)
    }
    
}
