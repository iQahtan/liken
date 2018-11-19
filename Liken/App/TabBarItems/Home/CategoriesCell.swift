//
//  CategoriesCell.swift
//  Liken
//
//  Created by Qahtan on 11/13/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class CategoriesCell: UICollectionViewCell {
    let titleLabel : UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor =  UIColor(named: "labelTextColor")
        label.font = UIFont(name: "Tajawal Medium", size: 15.0)
        return label
    }()
    override var isSelected: Bool {
        didSet {
            if self.isSelected
            {
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.backgroundColor = UIColor(named: "labelTextColor")
                titleLabel.textColor = .white
            }
            else
            {
                self.transform = CGAffineTransform.identity
                self.backgroundColor = UIColor.clear
                titleLabel.textColor = UIColor(named: "labelTextColor")
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
//        layer.cornerRadius = self.frame.height / 2
        layer.masksToBounds  = true
        titleLabel.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 4, paddingRight:4, paddingBottom: 4, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
