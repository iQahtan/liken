//
//  TempletViewController.swift
//  Liken
//
//  Created by Qahtan on 11/16/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class TempletViewController: UIViewController {
    
    let statusBarView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "NavColor")
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.dismissKeyboard()
//        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar(image: #imageLiteral(resourceName: "Group 5"))
    }
    func setupNavigationBar(image:UIImage) {
        
        UIApplication.shared.statusBarStyle = .lightContent
        view.addSubview(statusBarView)
        let label = UILabel()
        label.font = UIFont(name: "Questv1-Bold", size: 19)
        label.textColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Questv1-Bold", size: 19),NSAttributedStringKey.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backIndicatorImage = image.withRenderingMode(.alwaysOriginal)
        self.navigationItem.backBarButtonItem?.title = " "
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = image.withRenderingMode(.alwaysOriginal)
        
        statusBarView.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 20)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavColor")
    }
}
