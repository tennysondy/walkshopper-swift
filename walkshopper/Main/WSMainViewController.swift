//
//  WSMainViewController.swift
//  walkshopper
//
//  Created by 丁 一 on 15/8/18.
//  Copyright (c) 2015年 Ding Yi. All rights reserved.
//

import UIKit

class WSMainViewController: UITabBarController, UITabBarControllerDelegate {

    class func registerRoutes() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        var nav : UINavigationController = viewController as! UINavigationController;
        if nav.viewControllers.first!.isKindOfClass(WSMineViewController) {
            if UserSession.sharedInstance.isLogin == false {
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                var loginVC = storyboard.instantiateViewControllerWithIdentifier("WSLoginViewController") as! WSLoginViewController
                nav = UINavigationController(rootViewController: loginVC)
                self.presentViewController(nav, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
}
