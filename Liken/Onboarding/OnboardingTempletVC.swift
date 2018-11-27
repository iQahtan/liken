//
//  FirstPage.swift
//  Liken
//
//  Created by Qahtan on 11/19/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class OnboardingTempletVC: UIViewController {
    
    let image: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    let smallImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    let textLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Questv1-Bold", size: 20)
        lab.textColor = .white
        lab.textAlignment = .center
        return lab
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(image)
        view.addSubview(smallImageView)
        image.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        smallImageView.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 150, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 170, height: 299)
        smallImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.addSubview(textLabel)
        textLabel.anchor(top: smallImageView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 30)
        
    }
}
