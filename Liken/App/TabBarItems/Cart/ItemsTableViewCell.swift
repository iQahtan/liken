//
//  ItemsTableViewCell.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ItemsTableViewCell: UITableViewCell {
    
    
    var counter = 0
    
    let itemImage: CustomImageView = {
        let image = CustomImageView()
        image.backgroundColor = .red
        return image
    }()
    
    let itemName: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 13)
        lab.text = "عصير المراعي توت 1.5 لتر"
        lab.backgroundColor = .yellow
        lab.textColor = UIColor.rgb(red: 88, green: 88, blue: 88 )
        return lab
    }()
    let itemCurrentPrice: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 12)
        lab.text = "5.00 SR"
        lab.backgroundColor = .green
        lab.textColor = UIColor.rgb(red: 84, green: 203, blue: 136)
        lab.textColor = UIColor.rgb(red: 231, green: 96, blue: 72)
        return lab
    }()
    let itemLastPrice: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 8)
        lab.text = "5.00 SR"
        lab.textAlignment = .center
        lab.backgroundColor = .gray
        lab.textColor = UIColor.rgb(red: 132, green: 130, blue: 130)
        return lab
    }()
    let pluseButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "Group 3").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        btn.addTarget(self, action: #selector(handlePluseCounter), for: .touchUpInside)
        btn.tag = 0
        return btn
    }()
    let minuesButton: UIButton = {
        let btn = UIButton(type: .system)
        
        btn.setImage(#imageLiteral(resourceName: "054-minus").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        return btn
    }()
    let counterLabel: UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        lab.text = "1"
        lab.textColor = UIColor.rgb(red: 88, green: 88, blue: 88)
        return lab
    }()
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        return sv
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(itemImage)
        counterLabel.text = "\(counter)"
        itemImage.anchor(top: topAnchor, left: self.leadingAnchor, right: nil, bottom: nil, paddingTop: 8, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 65, height: 65)
        addSubview(itemName)
        itemName.anchor(top: topAnchor, left: itemImage.trailingAnchor, right: self.trailingAnchor, bottom: nil, paddingTop: 8, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 0, height: 20)
        
        addSubview(itemCurrentPrice)
        itemCurrentPrice.anchor(top: itemName.bottomAnchor, left: itemImage.trailingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 8, paddingRight: 0, paddingBottom: 0, width: 50, height: 40)
        
        addSubview(itemLastPrice)
        itemLastPrice.anchor(top: itemName.bottomAnchor, left: itemCurrentPrice.trailingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 8, paddingRight: 0, paddingBottom: 0, width: 40, height: 40)
        
        setupStackView()
        
    }
    func setupStackView(){
        addSubview(pluseButton)
        addSubview(minuesButton)
        addSubview(counterLabel)
        pluseButton.anchor(top: itemName.bottomAnchor, left: nil, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 10, paddingLeft: 0, paddingRight: 8, paddingBottom: 0, width: 44, height: 44)
        
        counterLabel.anchor(top: itemName.bottomAnchor, left: nil, right:pluseButton.leadingAnchor, bottom: bottomAnchor, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 20, height: 44)
//
        minuesButton.anchor(top: itemName.bottomAnchor, left: nil, right: counterLabel.leadingAnchor, bottom: bottomAnchor, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 44, height: 44)
//
    }
    @objc func handlePluseCounter(sender: UIButton) {
        print("handlePluseCounter", sender.tag)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
