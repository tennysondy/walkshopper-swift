//
//  WSVerifyPhoneNumberViewController.swift
//  walkshopper
//
//  Created by Ding Yi on 15/8/18.
//  Copyright (c) 2015年 Ding Yi. All rights reserved.
//

import UIKit


class WSVerifyPhoneNumberViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var verifiedNumTextField: UITextField!
    @IBOutlet weak var getVerifiedNumBtn: UIButton!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var nextStep: UIButton!
    
    var countDownSeconds = 0
    var timer : NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.phoneNumberTextField.text = "13811710822"
        self.getVerifiedNumBtn.addTarget(self, action: "getVerifiedNumber", forControlEvents: UIControlEvents.TouchUpInside)
        self.countDownLabel.hidden = true
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func getVerifiedNumber()
    {
        self.countDownSeconds = 60
        self.countDownLabel.text = NSString(format: "剩余%d秒", self.countDownSeconds) as String
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "resetGetVerifiedNumBtn", userInfo: nil, repeats: true)
        self.countDownLabel.hidden = false
        self.getVerifiedNumBtn.hidden = true
        SMS_SDK.getVerificationCodeBySMSWithPhone(self.phoneNumberTextField.text, zone: "86") { (error : SMS_SDKError?) -> Void in
            if let nError = error {
                var alertView = UIAlertView(title: nil, message: nError.description, delegate: nil, cancelButtonTitle: "确定")
                alertView.show()
            } else {
                
            }
        }
    }
    
    func resetGetVerifiedNumBtn()
    {
        self.countDownSeconds--
        self.countDownLabel.text = NSString(format: "剩余%d秒", self.countDownSeconds) as String
        if self.countDownSeconds == -1 {
            self.timer?.invalidate()
            self.getVerifiedNumBtn.hidden = false
            self.countDownLabel.hidden = true
        }
    }
}
