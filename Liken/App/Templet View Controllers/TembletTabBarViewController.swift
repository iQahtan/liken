//
//  TembletTabBarViewController.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class TembletTabBarViewController: UIViewController {
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var viewTitle: String!
    var color : UIColor!
    var textColor: UIColor!
    
    let label :  UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        return lab
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
    }
    func setupTitle() {
        view.addSubview(label)
        label.anchor(top: imageView.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 50)
        label.layer.cornerRadius = 25
        label.layer.masksToBounds = true
        label.backgroundColor = color
        label.attributedText = NSMutableAttributedString(string: viewTitle, attributes: [NSAttributedStringKey.font : UIFont(name: "Questv1-Bold", size: 22) ,NSAttributedStringKey.foregroundColor: textColor])
    }
    func setupBackgroundImage() {
        
        view.backgroundColor = UIColor(named: "NavColor")
        view.addSubview(imageView)
        imageView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop:75, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        imageView.image = #imageLiteral(resourceName: "home page")
    }
}
