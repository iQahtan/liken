//
//  CheckOutView.swift
//  Liken
//
//  Created by Qahtan on 11/22/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class CheckOutView: UIView {
    
    let itemsPrice : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 17)
        lab.text = "سعر المنتجات"
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let delivryPrice : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 17)
        lab.text = "سعر التوصيل"
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let total : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Bold", size: 18)
        lab.text = "إجمالي قيمة طلبك"
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let itemsPriceValue : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 17)
        lab.text = "230 SR"
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        lab.textAlignment = .left
        return lab
    }()
    let delivryPriceValue : UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 17)
        lab.text = "30 SR"
        lab.textAlignment = .left
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let totalValue : UILabel = {
        let lab = UILabel()
        lab.textAlignment = .left
        lab.font = UIFont(name: "Tajawal-Bold", size: 18)
        lab.text = "260 SR"
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let chekoutButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setAttributedTitle(NSAttributedString(string: "تأكيد الطلب", attributes: [NSAttributedStringKey.font :UIFont(name: "Tajawal-Bold", size: 18),NSAttributedStringKey.foregroundColor:UIColor.white ]), for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 86, green: 205, blue: 139)
        btn.layer.cornerRadius = 23
        btn.layer.masksToBounds = true
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemsPrice)
        itemsPrice.anchor(top: topAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 120, height: 23)
        addSubview(delivryPrice)
        delivryPrice.anchor(top: itemsPrice.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 120, height: 23)
        addSubview(total)
        total.anchor(top: delivryPrice.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 146, height: 26)
        
//-----------------
        addSubview(itemsPriceValue)
        itemsPriceValue.anchor(top: topAnchor, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 150, height: 23)
        addSubview(delivryPriceValue)
        delivryPriceValue.anchor(top: itemsPrice.bottomAnchor, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 150, height: 23)
        addSubview(totalValue)
        totalValue.anchor(top: delivryPrice.bottomAnchor, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 150, height: 26)
        
///--------------
        addSubview(chekoutButton)
        chekoutButton.anchor(top: nil, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 40, width: 0, height: 46)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
