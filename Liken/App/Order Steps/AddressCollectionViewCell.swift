//
//  AddressCollectionViewCell.swift
//  Liken
//
//  Created by Qahtan on 11/23/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class AddressCollectionViewCell: UICollectionViewCell {
    
    let name : UILabel = {
        let lab = UILabel()
        lab.text = "المنزل"
        lab.font = UIFont(name: "Tajawal-Bold", size: 13)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()

    let descrip: UILabel  = {
        let lab = UILabel()
        lab.numberOfLines = 0
        lab.textAlignment = .right
        lab.backgroundColor = .white
        lab.text = "    الرياض، السعادة،/n مخرج 15"
        lab.font = UIFont(name: "Tajawal-Medium", size: 11)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let editeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.tintColor = UIColor.rgb(red: 121, green: 121, blue: 121)
        btn.backgroundColor  = .blue
        return btn
    }()
    let deleteButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.tintColor = UIColor.rgb(red: 121, green: 121, blue: 121)
        btn.backgroundColor  = .blue
        return btn
    }()
    let thumbnilImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    override var isSelected: Bool {
        didSet {
            if self.isSelected{
                self.layer.borderWidth = 3
                self.layer.borderColor = UIColor(named: "green")?.cgColor
            }else{
                self.layer.borderColor = UIColor.rgb(red: 211, green: 211, blue: 211).cgColor
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews(){
        addSubview(name)
        name.anchor(top: topAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 17, paddingLeft: 22, paddingRight: 0, paddingBottom: 0, width: 38, height: 19)
        addSubview(descrip)
        descrip.anchor(top: name.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 22, paddingRight: 0, paddingBottom: 0, width: 100, height: 35)
        addSubview(editeButton)
        editeButton.anchor(top: nil, left: leadingAnchor, right: nil, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 22, paddingRight: 0, paddingBottom: 10, width: 40, height: 40)
        addSubview(deleteButton)
        deleteButton.anchor(top: nil
            , left: editeButton.trailingAnchor, right: nil, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 20, paddingRight: 0, paddingBottom: 10, width: 40, height: 40)
        addSubview(thumbnilImage)
        thumbnilImage.anchor(top: topAnchor, left: nil, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 0, paddingRight: 4, paddingBottom: 4, width: 130, height: 0)
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.rgb(red: 211, green: 211, blue: 211).cgColor
        self.layer.borderWidth = 3
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
