//
//  ItemsCollectionViewCell.swift
//  Liken
//
//  Created by Qahtan on 11/25/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ItemsCollectionViewCell: UICollectionViewCell {
    
    let itemImage: CustomImageView = {
        let im = CustomImageView()
        im.image = #imageLiteral(resourceName: "Almarai_Juices_1.5L_ETQ_100-Grape_on_bottle")
        return im
    }()
    let itemNameLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 13)
        lab.text = "إسم المنتج"
        lab.textAlignment = .center
        lab.adjustsFontSizeToFitWidth = true
        lab.textColor = UIColor.rgb(red: 88, green: 88, blue: 88)
        return lab
    }()
    let itemDetilesLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 11)
        lab.text = "إسم المنتج"
        lab.textAlignment = .center
        lab.adjustsFontSizeToFitWidth = true
        lab.textColor = UIColor.rgb(red: 253, green: 108, blue: 82)
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemImage)
        itemImage.anchor(top: topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 4, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 44, height: 44)
        itemImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(itemNameLabel)
        itemNameLabel.anchor(top: itemImage.bottomAnchor, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 4, paddingRight: 4, paddingBottom: 0, width: 0, height: 20)
        addSubview(itemDetilesLabel)
        itemDetilesLabel.anchor(top: itemNameLabel.bottomAnchor, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 4, paddingRight: 4, paddingBottom: 0, width: 0, height: 18)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
