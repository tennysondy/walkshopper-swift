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
    @IBOutlet weak var verificationCodeTextField: UITextField!
    @IBOutlet weak var getVerificationCodeBtn: UIButton!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var nextStepBtn: UIButton!
    
    var countDownSeconds = 0
    var timer : NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getVerificationCodeBtn.addTarget(self, action: "getVerificationCode", forControlEvents: UIControlEvents.TouchUpInside)
        self.nextStepBtn.addTarget(self, action: "nextStep", forControlEvents: UIControlEvents.TouchUpInside)
        self.countDownLabel.hidden = true
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
//MARK: Get verification code
    func getVerificationCode()
    {
        if self.isPhoneNumValid() == false {
            return
        }
        
        self.countDownSeconds = 60
        self.countDownLabel.text = NSString(format: "剩余%d秒", self.countDownSeconds) as String
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "resetGetVerifiedNumBtn", userInfo: nil, repeats: true)
        self.countDownLabel.hidden = false
        self.getVerificationCodeBtn.hidden = true
        SMS_SDK.getVerificationCodeBySMSWithPhone(self.phoneNumberTextField.text, zone: "86") { (error : SMS_SDKError?) -> Void in
            if let e = error {
                var alertView = UIAlertView(title: nil, message: e.description, delegate: nil, cancelButtonTitle: "确定")
                alertView.show()
            } else {
                
            }
        }
    }
    
    func resetGetVerifiedNumBtn()
    {
        self.countDownSeconds--
        if self.countDownSeconds == -1 {
            self.timer?.invalidate()
            self.getVerificationCodeBtn.hidden = false
            self.countDownLabel.hidden = true
        }
        self.countDownLabel.text = NSString(format: "剩余%d秒", self.countDownSeconds) as String
    }
    
    func nextStep()
    {
        if self.isVerificationCodeValid() == false {
            return
        }
        
        SMS_SDK.commitVerifyCode(self.verificationCodeTextField.text, result: { (state : SMS_ResponseState) -> Void in
            switch state.value {
            case SMS_ResponseStateSuccess.value:
                println("注册成功")
            default:
                var alertView = UIAlertView(title: nil, message: "请输入手机号", delegate: nil, cancelButtonTitle: "确定")
                alertView.show()
            }
        })
    }
    
//MARK: Phone number & verification code validation
    func isPhoneNumValid() -> Bool
    {
        println(count(self.phoneNumberTextField.text))
        if count(self.phoneNumberTextField.text) == 0 {
            var alertView = UIAlertView(title: nil, message: "请输入手机号", delegate: nil, cancelButtonTitle: "确定")
            alertView.show()
            return false
        }
        var rule = "^1(3|5|7|8|4)\\d{9}"
        var pred = NSPredicate(format: "SELF MATCHES %@", rule) as NSPredicate
        var isMatch = pred.evaluateWithObject(self.phoneNumberTextField.text)
        if isMatch == false {
            var alertView = UIAlertView(title: nil, message: "手机号码格式错误，请重新输入", delegate: nil, cancelButtonTitle: "确定")
            alertView.show()
        }
        return isMatch
    }
    
    func isVerificationCodeValid() -> Bool
    {
        var rule = "^\\d{4}"
        var pred = NSPredicate(format: "SELF MATCHES %@", rule) as NSPredicate
        var isMatch = pred.evaluateWithObject(self.phoneNumberTextField.text)
        if isMatch == false {
            var alertView = UIAlertView(title: nil, message: "验证码错误，请重新输入", delegate: nil, cancelButtonTitle: "确定")
            alertView.show()
        }
        
        return isMatch
    }
    

}
