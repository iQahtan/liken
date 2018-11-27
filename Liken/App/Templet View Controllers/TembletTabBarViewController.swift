//
//  TembletTabBarViewController.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class TembletTabBarViewController: TempletViewController {
    
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    var viewTitle: String!
    var color : UIColor!
    var textColor: UIColor!
    let collectionView: UICollectionView = {
        let coll = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return coll
    }()
    let label :  UILabel = {
        let lab = UILabel()
        lab.translatesAutoresizingMaskIntoConstraints = false
        lab.textAlignment = .center
        return lab
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
    }
    func setupTitle() {
        view.addSubview(label)
//        label.anchor(top: imageView.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 50)
        label.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -40).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.layer.cornerRadius = 25
        label.layer.masksToBounds = true
        label.backgroundColor = color
        label.attributedText = NSMutableAttributedString(string: viewTitle, attributes: [NSAttributedStringKey.font : UIFont(name: "Questv1-Bold", size: 22) ,NSAttributedStringKey.foregroundColor: textColor])
        view.addSubview(collectionView)
        collectionView.anchor(top: label.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 20, paddingLeft: 0, paddingRight: 0, paddingBottom: 20, width: 0, height: 0)
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsetsMake(4, 8, 4,8)
    }
    func setupBackgroundImage() {
        
        view.backgroundColor = UIColor(named: "NavColor")
        view.addSubview(imageView)
        imageView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop:75, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        imageView.image = #imageLiteral(resourceName: "home page")

    }
}
