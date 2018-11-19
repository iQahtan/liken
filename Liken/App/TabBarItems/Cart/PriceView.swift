//
//  PriceView.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class PriceView: UIView {
    
    let total: UILabel = {
        let lab  = UILabel()
        lab.text = "إجمالي سعر المنتجات"
        lab.font = UIFont(name: "Tajawal-Medium", size: 15)
        lab.textColor = UIColor.rgb(red: 78, green: 78, blue: 78 )
        return lab
    }()
    let totalPrice : UILabel = {
        let lab  = UILabel()
        lab.textAlignment = .left
        lab.text = "560 SR"
        lab.adjustsFontSizeToFitWidth = true
        lab.font = UIFont(name: "Tajawal-Bold", size: 22)
        lab.textColor = UIColor.rgb(red: 231, green: 96, blue: 72)
        return lab
    }()
    let bottomButtonsStackView :  UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()
    let bottomButtons: [UIButton]={
        
        let checkout = UIButton(type: .system)
        checkout.backgroundColor = UIColor(named: "green")
        let attributedString = NSMutableAttributedString(string: NSLocalizedString("checkout",comment:""), attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont(name: "Questv1-Bold", size: 17.0)])
        checkout.setAttributedTitle(attributedString, for: .normal)
        checkout.addTarget(self, action: #selector(handleCheckout), for: .touchUpInside)
        
        let continueShopping = UIButton(type: .system)
        continueShopping.backgroundColor = .white
        continueShopping.layer.borderColor = UIColor.rgb(red: 67, green: 151, blue: 255).cgColor
        continueShopping.layer.borderWidth = 1
        
        let attributedStringVistor = NSMutableAttributedString(string: NSLocalizedString("continueShopping",comment:""), attributes: [NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 67, green: 151, blue: 255),NSAttributedStringKey.font:UIFont(name: "Questv1-Bold", size: 16.0)])
        continueShopping.setAttributedTitle(attributedStringVistor, for: .normal)
        continueShopping.addTarget(self, action: #selector(handleContinueShopping), for: .touchUpInside)
        return [checkout,continueShopping]
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPriceLabels()
        setupStackView()
    }
    func setupPriceLabels() {
        addSubview(total)
        total.anchor(top: self.topAnchor, left: self.leadingAnchor, right: nil, bottom: nil, paddingTop: 8, paddingLeft: 8, paddingRight: 0, paddingBottom: 0, width: 150, height: 42)
        
        addSubview(totalPrice)
        totalPrice.anchor(top: self.topAnchor, left: nil, right: self.trailingAnchor, bottom: nil, paddingTop: 8, paddingLeft: 0, paddingRight: 8, paddingBottom: 0, width: 150, height: 42)
        
    }
    func setupStackView() {
        addSubview(bottomButtonsStackView)
        bottomButtonsStackView.anchor(top: nil, left: self.leadingAnchor, right: self.trailingAnchor, bottom: self.bottomAnchor, paddingTop: 0, paddingLeft: 8, paddingRight: 8, paddingBottom: 8, width: 0, height: 42)
        for i in 0..<bottomButtons.count {
            bottomButtons[i].layer.cornerRadius = 21
            bottomButtonsStackView.addArrangedSubview(bottomButtons[i])
        }
    }
    @objc func handleCheckout() {
        
    }
    @objc func handleContinueShopping() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
