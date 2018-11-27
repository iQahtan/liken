//
//  MyOrdersCell.swift
//  Liken
//
//  Created by Qahtan on 11/21/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class MyOrdersCell: UICollectionViewCell {
    
    var status: Int? {
        didSet {
            guard let status = status else { return }
            if status == 1 {
                bgColor = UIColor.rgb(red: 214, green: 255, blue: 232)
                buttonBg = UIColor.rgb(red: 86, green: 206, blue: 139)
                borderColor = UIColor.rgb(red: 86, green: 206, blue: 139).cgColor
            }else if status == 2 {
                bgColor = UIColor.rgb(red: 255, green: 245, blue: 236)
                buttonBg = UIColor.rgb(red: 255, green: 183, blue: 127)
                borderColor = UIColor.rgb(red: 255, green: 183, blue: 127).cgColor
            }else {
                bgColor = UIColor.rgb(red: 255, green: 237, blue: 234)
                buttonBg = UIColor.rgb(red: 253, green: 108, blue: 82)
                borderColor = UIColor.rgb(red: 253, green: 108, blue: 82).cgColor
            }
        }
    }
    var bgColor: UIColor? {
        didSet {
            guard let bgColor = bgColor else { return }
            self.backgroundColor = bgColor
        }
    }
    var borderColor: CGColor? {
        didSet {
            guard let borderColor = borderColor else { return }
            self.layer.borderColor = borderColor
        }
    }
    var buttonBg: UIColor? {
        didSet {
            guard let textColor = buttonBg else { return }
            self.orderStatusValue.textColor = textColor
            self.reseptBtn.backgroundColor = textColor
            let attrbutedString =  NSMutableAttributedString(string: "فاتورة الطلب", attributes:[NSAttributedStringKey.font :UIFont(name: "Tajawal-Medium", size: 11),NSAttributedStringKey.foregroundColor:UIColor.white ])
            self.reseptBtn.setAttributedTitle(attrbutedString, for: .normal)
        }
    }
    let orderNumber : UILabel = {
        let lab = UILabel()
        lab.text = "رقم الطلب:"
        lab.font = UIFont(name: "Tajawal-Medium", size: 12)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let orderNumberValue : UILabel = {
        let lab = UILabel()
        lab.text = "958dcds4"
        lab.font = UIFont(name: "Tajawal-Light", size: 12)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let orderDate : UILabel = {
        let lab = UILabel()
        lab.text = "تاريخ الطلب:"
        lab.font = UIFont(name: "Tajawal-Medium", size: 12)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let orderDateValue: UILabel = {
        let lab = UILabel()
        lab.text = "2018-11-01"
        lab.font = UIFont(name: "Tajawal-Light", size: 12)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let deliveryTime : UILabel = {
        let lab = UILabel()
        lab.text = "تاريخ ووقت التوصيل:"
        lab.font = UIFont(name: "Tajawal-Medium", size: 12)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let deliveryTimeValue: UILabel = {
        let lab = UILabel()
//        lab.text = "2018-11-01"
        lab.text = "2018-10-01 | 2:00 م -4:00 م"
        lab.font = UIFont(name: "Tajawal-Light", size: 12)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let orderStatus : UILabel = {
        let lab = UILabel()
        lab.text = "حالة الطلب:"
        lab.font = UIFont(name: "Tajawal-Medium", size: 12)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let orderStatusValue : UILabel = {
        let lab = UILabel()
        lab.text = "تم التوصيل"
        lab.font = UIFont(name: "Tajawal-Medium", size: 12)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let reseptBtn: UIButton = {
        let btn = UIButton(type: .system)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }
    func setupLabels() {
        self.backgroundColor = bgColor
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColor
        self.layer.masksToBounds = true
        
        self.addSubview(orderNumber)
        orderNumber.anchor(top: topAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 19, paddingLeft: 13, paddingRight: 0, paddingBottom: 0, width: 75, height: 17)
        self.addSubview(orderNumberValue)
        orderNumberValue.anchor(top: topAnchor, left: orderNumber.trailingAnchor, right: nil, bottom: nil, paddingTop: 19, paddingLeft: 4, paddingRight: 0, paddingBottom: 0, width: 80, height: 17)
        
        self.addSubview(orderDateValue)
        orderDateValue.anchor(top: topAnchor, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 19, paddingLeft: 0, paddingRight: 13, paddingBottom: 0, width: 80, height: 17)
        self.addSubview(orderDate)
        orderDate.anchor(top: topAnchor, left: nil, right: orderDateValue.leadingAnchor, bottom: nil, paddingTop: 19, paddingLeft: 4, paddingRight: 4, paddingBottom: 0, width: 65, height: 17)
        
        self.addSubview(deliveryTime)
        deliveryTime.anchor(top: orderDateValue.bottomAnchor, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 9, paddingLeft: 13, paddingRight: 23, paddingBottom: 0, width: 0, height: 17)
        
        self.addSubview(deliveryTimeValue)
        deliveryTimeValue.anchor(top: deliveryTime.bottomAnchor, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 9, paddingLeft: 13, paddingRight: 23, paddingBottom: 0, width: 0, height: 17)
        
        self.addSubview(orderStatus)
        orderStatus.anchor(top: deliveryTimeValue.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 9, paddingLeft: 13, paddingRight: 23, paddingBottom: 0, width: 65, height: 17)
        
        self.addSubview(orderStatusValue)
        orderStatusValue.anchor(top: deliveryTimeValue.bottomAnchor, left: orderStatus.trailingAnchor, right: nil, bottom: nil, paddingTop: 9, paddingLeft: 4, paddingRight: 23, paddingBottom: 0, width: 65, height: 17)
        
        self.addSubview(reseptBtn)
        reseptBtn.anchor(top: deliveryTimeValue.bottomAnchor, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 13, paddingBottom: 0, width: 80, height: 26)
        reseptBtn.layer.cornerRadius = 13
        reseptBtn.layer.masksToBounds = true
        
        orderStatusValue.textColor = buttonBg
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
