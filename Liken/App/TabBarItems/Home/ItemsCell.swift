//
//  ItemsCell.swift
//  Liken
//
//  Created by Qahtan on 11/14/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ItemsCell: UICollectionViewCell{
    let itemImage: CustomImageView = {
        let imageview = CustomImageView()
        return imageview
    }()
    let itemsTitle: UILabel = {
        let label = UILabel()
        label.text = "عصير المراعي عنب 1.5 لتر"
        label.textColor = UIColor(named: "labelTextColor")
        label.font = UIFont(name: "Tajawal Medium", size: 10.0)
        label.textAlignment = .center
       return label
    }()
    let itemCurrentPrice: UILabel = {
        let label = UILabel()
        label.text = "5.00 SR"
        label.textColor = UIColor.rgb(red: 253, green: 108, blue: 82)
        label.font = UIFont(name: "Tajawal-Bold", size: 17.0)
        label.textAlignment = .center
        return label
    }()
    let itemBeforPrice: UILabel = {
        let label = UILabel()
        label.text = "9.5 SR"
        label.textAlignment = .center
        label.textColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        label.font = UIFont(name: "Tajawal Medium", size: 12.0)
        label.textAlignment = .center
        return label
    }()
    let descountView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    let discountValue: UILabel = {
       let lab = UILabel()
        lab.text = "47%"
        lab.textAlignment = .center
        lab.font = UIFont(name: "Tajawal-Medium", size: 11.0)
        lab.textColor = .white
        return lab
    }()
//--- incrmentor
    let plusButton : UIButton = {
        let btn = UIButton(type: .system)
//        btn.setBackgroundImage(#imageLiteral(resourceName: "Group 63"), for: .normal)
        btn.backgroundColor =  .yellow
        return btn
    }()
    let counterLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Tajawal Medium", size: 17.0)
        label.textAlignment = .center
        label.textColor = UIColor(named: "labelTextColor")
        return label
    }()
    let minusButton : UIButton = {
        let btn = UIButton(type: .system)
//        btn.setBackgroundImage(#imageLiteral(resourceName: "Group 63"), for: .normal)
        btn.backgroundColor =  .red
        return btn
    }()
    var counter = 1
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemImage)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        itemImage.anchor(top: topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 6, paddingLeft: 0, paddingRight: 0, paddingBottom: 0 , width: 94, height: 94)
        itemImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addSubview(itemsTitle)
        itemsTitle.anchor(top: itemImage.bottomAnchor, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 6, paddingLeft: 6, paddingRight: 6, paddingBottom: 0, width: 0, height: 20)
        setupStackView()
        self.addSubview(itemCurrentPrice)
        itemCurrentPrice.anchor(top:  itemsTitle.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 6, paddingLeft: 6, paddingRight: 0, paddingBottom: 0, width: 60, height: 22)
        self.addSubview(itemBeforPrice)
        itemBeforPrice.anchor(top:  itemCurrentPrice.bottomAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 6, paddingLeft: 6, paddingRight: 0, paddingBottom: 0, width: 60, height: 12)
        
        addSubview(descountView)
        descountView.anchor(top: topAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 14, paddingRight: 0, paddingBottom: 0, width: 27, height: 29)
        
        descountView.addSubview(discountValue)
        discountValue.anchor(top: descountView.topAnchor, left: descountView.leadingAnchor, right: descountView.trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 1, paddingRight: 1, paddingBottom: 0, width: 0, height: 19)
        
        let boundss = CGRect(x: 0, y: 0, width:27 , height: 29)
        let bezierPath = UIBezierPath(roundedRect: boundss, byRoundingCorners: [ UIRectCorner.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 70, height: 70))
        let maskLayer = CAShapeLayer()
        maskLayer.path = bezierPath.cgPath
        descountView.layer.mask = maskLayer
    }
    func setupStackView() {
        counterLabel.text = "\(counter)"
        self.addSubview(plusButton)
        plusButton.anchor(top: itemsTitle.bottomAnchor, left: nil, right: self.trailingAnchor, bottom: nil, paddingTop: 6, paddingLeft: 0, paddingRight: 4, paddingBottom: 4, width: 34, height: 34)
        self.addSubview(counterLabel)
        counterLabel.anchor(top: itemsTitle.bottomAnchor, left: nil, right: plusButton.leadingAnchor, bottom: nil, paddingTop: 6, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 20, height: 34)
        self.addSubview(minusButton)
        minusButton.anchor(top: itemsTitle.bottomAnchor, left: nil, right: counterLabel.leadingAnchor, bottom: nil, paddingTop: 6, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 34, height: 34)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
