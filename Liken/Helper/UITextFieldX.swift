//
//  UITextFieldX.swift
//  Resours
//
//  Created by Qahtan on 4/29/17.
//  Copyright © 2017 Qahtan. All rights reserved.
//

import UIKit

@IBDesignable
class UITextFieldX: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var cornerRadius: CGFloat = 0  {
        didSet{
            updatUILabel()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            updatUILabel()
        }
    }
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            updatUILabel()
        }
    }
    
    @IBInspectable var MasToBounds: Bool = false {
        didSet{
            updatUILabel()
        }
    }
    
    @IBInspectable var FirstColor: UIColor = UIColor.clear {
        didSet{
            updatUILabel()
        }
    }
    @IBInspectable var SecondColor: UIColor = UIColor.clear{
        didSet{
            updatUILabel()
        }
    }
    
    override class var layerClass: AnyClass {
        get{
            return CAGradientLayer.self
        }
    }
    func updatUILabel(){
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]
        self.layer.masksToBounds = MasToBounds
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
        self.borderStyle = .none
        
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.red.cgColor
        borderLayer.frame = CGRect(x: self.frame.width - 1, y: 0, width: 1, height: self.frame.height)
        self.layer.addSublayer(borderLayer)
    }


}
