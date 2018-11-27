//
//  ProdictChoesessCell.swift
//  Liken
//
//  Created by Qahtan on 11/25/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ProdictChoesessCell: UICollectionViewCell {
    
    let label: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Bold", size: 14)
        lab.textColor = UIColor.rgb(red: 131, green: 131, blue: 131)
        lab.text = "منتجات مشابهه"
        lab.textAlignment = .center
        return lab
    }()
    let selectorView: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor(named:"green")
        vi.layer.cornerRadius = 1.5
        vi.layer.masksToBounds = true
        return vi
    }()
    override var isSelected: Bool {
        didSet {
            if self.isSelected{

                label.textColor = UIColor(named: "green")
                selectorView.isHidden = false
            }else{
                selectorView.isHidden = true
                label.textColor = UIColor.rgb(red: 131, green: 131, blue: 131)
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 8, paddingLeft: 2, paddingRight: 2, paddingBottom: 0, width: 0, height: 25)
        addSubview(selectorView)
        selectorView.isHidden = true
        selectorView.anchor(top: label.bottomAnchor, left: label.leadingAnchor, right: label.trailingAnchor, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 0, paddingRight: 0, paddingBottom: 4, width: 0, height: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
