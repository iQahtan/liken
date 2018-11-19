//
//  ProfileViewController.swift
//  Liken
//
//  Created by Qahtan on 11/19/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ProfileViewController: UIViewController {
    let backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Back", for: .normal)
        btn.addTarget(self, action: #selector(handleDissmis), for: .touchUpInside)
        btn.backgroundColor = .red
        return btn
    }()
    var vi: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        setupGradientLayer()
//        view.backgroundColor = UIColor.rgb(red: 86, green: 206, blue: 139)
        
        view.addSubview(backButton)
        backButton.frame = CGRect(x: 200, y: 100, width: 100, height: 100)
    }
    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [UIColor.rgb(red: 86, green: 206, blue: 139).cgColor, UIColor.rgb(red: 60, green: 196, blue: 121).cgColor]
        gradientLayer.locations = [0.4,0.6]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    @objc func handleDissmis() {
        print("dismlsss")

    }
}
