//
//  AlselalCell.swift
//  Liken
//
//  Created by Qahtan on 11/23/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class AlselalCell: UICollectionViewCell {
    let imag: CustomImageView = {
        let im = CustomImageView()
        im.backgroundColor = .green
        im.image = #imageLiteral(resourceName: "food")
        return im
    }()
    let smallView: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 67, green: 151, blue: 255)
        return vi
    }()
    let name : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 11)
        lab.text = "سلة رمضان"
        lab.textAlignment = .right
        lab.textColor = UIColor.white
        lab.adjustsFontSizeToFitWidth = true
        return lab
    }()
    let price : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 10)
        lab.textAlignment = .left
        lab.text = "15.00 SR"
        lab.adjustsFontSizeToFitWidth = true
        lab.textColor = UIColor.white
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    func setupViews(){
        self.layer.cornerRadius = 6
        self.layer.borderWidth  = 3
        self.layer.borderColor = UIColor.rgb(red: 67, green: 151, blue: 255).cgColor
        self.layer.masksToBounds = true
        
        addSubview(smallView)
        smallView.anchor(top: nil, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 31)
        
        addSubview(imag)
        imag.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: smallView.topAnchor, paddingTop: 4, paddingLeft: 4, paddingRight: 4, paddingBottom: 4, width: 0, height: 0)
        imag.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        smallView.addSubview(name)
        
        smallView.addSubview(price)
        price.anchor(top: smallView.topAnchor, left: nil, right: smallView.trailingAnchor, bottom: smallView.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 4, paddingBottom: 0, width: 40, height: 0)
        
        name.anchor(top: smallView.topAnchor, left: smallView.leadingAnchor, right: price.leadingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 4, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        name.centerYAnchor.constraint(equalTo: smallView.centerYAnchor).isActive = true
       
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
