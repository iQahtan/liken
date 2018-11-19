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
        setupNavigationBar()
    }
    func setupNavigationBar() {
        UIApplication.shared.statusBarStyle = .lightContent
        view.addSubview(statusBarView)
        let label = UILabel()
        label.font = UIFont(name: "Questv1-Bold", size: 19)
        label.textColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Questv1-Bold", size: 19),NSAttributedStringKey.foregroundColor: UIColor.white]

        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "Group 63").withRenderingMode(.alwaysOriginal)
        self.navigationItem.backBarButtonItem?.title = " "
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "Group 63").withRenderingMode(.alwaysOriginal)
        
        statusBarView.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 20)
        view.backgroundColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "NavColor")
    }
}
