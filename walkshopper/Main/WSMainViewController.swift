//
//  WSMainViewController.swift
//  walkshopper
//
//  Created by 丁 一 on 15/8/18.
//  Copyright (c) 2015年 Ding Yi. All rights reserved.
//

import UIKit

class WSMainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "买卖";
        self.delegate = self;
        
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        var nav : UINavigationController = viewController as! UINavigationController;
        if nav.viewControllers.first!.isKindOfClass(WSMineViewController) {
            let storyboard = UIStoryboard(name: "Login", bundle: nil);
            var loginVC = storyboard.instantiateViewControllerWithIdentifier("WSLoginViewController") as! WSLoginViewController
            nav = UINavigationController(rootViewController: loginVC);
            self.presentViewController(nav, animated: true, completion: nil);
        }
    }
}
