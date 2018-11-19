//
//  StoresCell.swift
//  Liken
//
//  Created by Qahtan on 11/12/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit

class StoresCell: UICollectionViewCell {
    let image: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        image.anchor(top: topAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 8, paddingRight: 8, paddingBottom: 8, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
