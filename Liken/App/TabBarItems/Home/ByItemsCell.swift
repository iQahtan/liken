//
//  ByItemsCell.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ByItemsCell: UICollectionViewCell {
    let itemImage: CustomImageView = {
        let customImageView = CustomImageView()
        customImageView.backgroundColor = .gray
        return customImageView
    }()
    let titleLabel : UILabel = {
        let lab = UILabel()
        lab.backgroundColor = .yellow
        lab.textAlignment = .center
        return lab
    }()
    let selectView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "green")
        return view
    }()
    override var isSelected: Bool {
        didSet {
            if self.isSelected{
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                titleLabel.textColor = .white
                selectView.isHidden = false
            }else{
                self.transform = CGAffineTransform.identity
                self.backgroundColor = UIColor.clear
                titleLabel.textColor = UIColor(named: "labelTextColor")
                selectView.isHidden = true
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(itemImage)
        itemImage.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 4, paddingRight: 4, paddingBottom: 0, width: 0, height: 65)
        addSubview(titleLabel)
        titleLabel.anchor(top: nil, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 4, paddingRight: 4, paddingBottom: 4, width: 0, height: 20)
        addSubview(selectView)
        
        selectView.isHidden = true
        selectView.anchor(top: titleLabel.bottomAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 4, paddingRight: 4, paddingBottom:4, width: 0, height: 10)
        selectView.layer.cornerRadius = 5
        selectView.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
