//
//  TimeTableViewCell.swift
//  Liken
//
//  Created by Qahtan on 11/20/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class TimeCollectionViewCell: UICollectionViewCell {
//    let tColor =
    let texLabel: UILabel = {
        let lab = UILabel()
        lab.text = "2:00  -    12:00"
        lab.numberOfLines = 0
        lab.textAlignment = .center
        let attributedString  = NSMutableAttributedString(string: "2:00  -    12:00 \n", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Bold", size: 15),NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 120, green: 120, blue: 120)])
        attributedString.append(NSAttributedString(string: "قد تتأثر بأوقات الصلاة", attributes: [NSAttributedStringKey.font :UIFont(name: "Tajawal-Medium", size: 11),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 120, green: 120, blue: 120)]))
        lab.attributedText = attributedString
        return lab
    }()
    let priceLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .left
        let attributedString  = NSMutableAttributedString(string: "12 SR", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Bold", size: 15),NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 120, green: 120, blue: 120)])
//        attributedString.append(NSAttributedString(string: "قد تتأثر بأوقات الصلاة", attributes: [NSAttributedStringKey.font :UIFont(name: "Tajawal-Medium", size: 11),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 120, green: 120, blue: 120)]))
        lab.attributedText = attributedString
        return lab
    }()
    override var isSelected: Bool {
        didSet {
            if self.isSelected{
//                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.layer.borderWidth = 3
                self.layer.cornerRadius = 6
                self.layer.masksToBounds = true
                self.layer.borderColor = UIColor(named: "green")?.cgColor
//                setupLabel(color: UIColor.white, date: date!)
//                self.backgroundColor = UIColor(named: "green")
//                selectView.isHidden = false
            }else{
                self.layer.borderColor = UIColor.rgb(red: 217, green: 217, blue: 217).cgColor
                self.layer.borderWidth = 1
//                self.transform = CGAffineTransform.identity
//                self.backgroundColor = UIColor.white
                //                titleLabel.textColor = UIColor(named: "labelTextColor")
//                setupLabel(color: UIColor.rgb(red: 120, green: 120, blue: 120), date: date!)
//                selectView.isHidden = true
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(texLabel)
        texLabel.anchor(top: topAnchor, left: leadingAnchor, right: nil, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 4, paddingRight: 0, paddingBottom: 4, width: 200, height: 0)
        addSubview(priceLabel)
        priceLabel.anchor(top: topAnchor, left: nil, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 0, paddingRight: 20, paddingBottom: 4, width: 200, height: 0)
        
        self.layer.borderColor = UIColor.rgb(red: 217, green: 217, blue: 217).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
