//
//  CheckBox.swift
//  FirebaseAuth
//
//  Created by Qahtan on 9/23/18.
//

import UIKit
class CheckBox:UIButton{
    
    let checkedImage =  #imageLiteral(resourceName: "Ellipse 6").withRenderingMode(.alwaysOriginal)
    let uncheckedImage = #imageLiteral(resourceName: "Group 9").withRenderingMode(.alwaysOriginal)
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.image.image = uncheckedImage
//                self.setBackgroundImage(checkedImage, for: .normal)
            } else {
                self.image.image = checkedImage
                
//                self.setBackgroundImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    let image: UIImageView = {
        let im = UIImageView()
        
        im.contentMode = .scaleAspectFill
        return im
    }()
    let lab :UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
        image.image = checkedImage
        image.anchor(top: nil, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 4, paddingRight: 0, paddingBottom: 0, width: 20, height: 20)
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.addSubview(lab)
        lab.anchor(top: nil, left: image.trailingAnchor, right: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 4, paddingRight: 0, paddingBottom: 0, width: 0, height: 20)
        lab.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
//        let checkedImage = UIImage(named: "UnChickedBox")!.withRenderingMode(.alwaysTemplate)
////        self.tintColor = UIColor.rgb(red: 51, green: 104, blue: 146)
//        self.tintColor = UIColor(red: 51/255, green: 104/255, blue: 146/255, alpha: 1.0)
//        self.setBackgroundImage(checkedImage, for: .normal)
        self.isChecked = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
