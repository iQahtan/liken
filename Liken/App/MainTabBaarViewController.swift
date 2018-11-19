//
//  MainTabBaarViewController.swift
//  Liken
//
//  Created by Qahtan on 11/11/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit

class MainTabBaarViewController: UITabBarController {
    
    var logein = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if logein == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.showSignupVC()
            })
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//            let loginController =   SignupViewController()
//        })
//
//        let navigationController = UINavigationController(rootViewController: loginController)
//        self.present(navigationController, animated: true, completion: nil)
//        navigationController.isNavigationBarHidden = true
//        let signupVC  = SignupViewController()
//        self.present(signupVC, animated: true, completion: nil)
    }
    func showSignupVC() {
        let loginController =   SignupViewController()
        let navigationController = UINavigationController(rootViewController: loginController)
        self.present(navigationController, animated: true, completion: nil)
        navigationController.isNavigationBarHidden = true
    }
}
