//
//  DateCell.swift
//  Liken
//
//  Created by Qahtan on 11/20/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class DateCell: UICollectionViewCell {
    var date:Date? {
        didSet{
            guard let date = date else { return }
            setupLabel(color: UIColor.rgb(red: 120, green: 120, blue: 120), date: date)
        }
    }
    let selectView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "green")
        return view
    }()
    override var isSelected: Bool {
        didSet {
            if self.isSelected{
                self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                setupLabel(color: UIColor.white, date: date!)
                self.backgroundColor = UIColor(named: "green")
                selectView.isHidden = false
            }else{
                self.transform = CGAffineTransform.identity
                self.backgroundColor = UIColor.white
//                titleLabel.textColor = UIColor(named: "labelTextColor")
                setupLabel(color: UIColor.rgb(red: 120, green: 120, blue: 120), date: date!)
                selectView.isHidden = true
            }
        }
    }
    let dateText : UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.numberOfLines = 0
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.layer.cornerRadius = 45.0
        self.layer.cornerRadius = 45
        self.layer.masksToBounds = true
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath

        
        self.backgroundColor = UIColor.white
        addSubview(dateText)
        dateText.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeft: 5, paddingRight: 5, paddingBottom: 5, width: 80, height: 80)
    }
    func setupLabel (color:UIColor,date:Date) {
        let fmt = DateFormatter()
        fmt.dateFormat = "dd/MM"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayInWeek = formatter.string(from: date)
        
        let attributedString = NSMutableAttributedString(string: "\(fmt.string(from: date)) \n", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 25),NSAttributedStringKey.foregroundColor:color])
        attributedString.append(NSMutableAttributedString(string: "\(formatter.string(from: date))", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 11),NSAttributedStringKey.foregroundColor: color]))
        dateText.attributedText = attributedString
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
