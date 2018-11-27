//
//  LastStepOfOrder.swift
//  Liken
//
//  Created by Qahtan on 11/22/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class LastStepOfOrder: TempletViewController {
    
    let logoImage: UIImageView = {
        let iv  = UIImageView()
        iv.image = #imageLiteral(resourceName: "logo-dark").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    let thankYouLabel: UILabel = {
        let lab = UILabel()
        lab.text = "!شكراً لك "
        lab.textColor = UIColor.rgb(red: 67, green: 151, blue: 255)
        lab.font = UIFont(name: "Questv1-Bold", size: 31)
        return lab
    }()
    let centerImage: UIImageView = {
        let iv  = UIImageView()
        iv.image = #imageLiteral(resourceName: "shopping-bag (1)").withRenderingMode(.alwaysOriginal)
        
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    let orderNumber: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 18)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        lab.text = "رقم طلبك:"
        return lab
    }()
    let orderNumberValue: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 18)
        lab.text = "2G770035"
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        lab.textAlignment = .right
        return lab
    }()
    let deliveryInfo: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 18)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        lab.text = "وقت التوصيل:"
        return lab
    }()
    let deliveryInfoValue: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 18)
        lab.text = "الإثنين 12:00 م - 2:00م"
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        lab.textAlignment = .right
        return lab
    }()
    let tracking: UIButton = {
        let userType2 = UIButton(type: .system)
        userType2.backgroundColor = UIColor(named: "green")
        let attributedString = NSMutableAttributedString(string: "تتبع طلبي", attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont(name: "Tajawal-Bold", size: 18.0)])
        userType2.layer.cornerRadius = 22
        userType2.layer.masksToBounds = true
        userType2.addTarget(self, action: #selector(handleTrackingBtn), for: .touchUpInside)
        userType2.setAttributedTitle(attributedString, for: .normal)
        return userType2
    }()
    let homePage: UIButton = {
        let vistor = UIButton(type: .system)
        vistor.backgroundColor = .white
        vistor.layer.borderColor = UIColor.rgb(red: 67, green: 151, blue: 255).cgColor
        vistor.layer.borderWidth = 2
        vistor.layer.cornerRadius = 22
        vistor.layer.masksToBounds = true
        vistor.addTarget(self, action: #selector(handleHomePage), for: .touchUpInside)
        let attributedStringVistor = NSMutableAttributedString(string: "العودة للرئيسية", attributes: [NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 67, green: 151, blue: 255),NSAttributedStringKey.font:UIFont(name: "Tajawal-Bold", size: 18.0)])
        vistor.setAttributedTitle(attributedStringVistor, for: .normal)
        return vistor
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.rgb(red: 241, green: 241, blue: 241)

        
        self.statusBarView.backgroundColor = UIColor.rgb(red: 241, green: 241, blue: 241)
        view.addSubview(logoImage)
        logoImage.anchor(top: view.layoutMarginsGuide.topAnchor, left: nil, right: view.trailingAnchor, bottom: nil, paddingTop: 40, paddingLeft: 0, paddingRight: 37, paddingBottom: 0, width: 91, height: 40)
        
        view.addSubview(centerImage)
        centerImage.anchor(top: logoImage.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 30, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 250)
//        centerImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.addSubview(thankYouLabel)
        thankYouLabel.anchor(top: centerImage.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 126, height: 42)
        thankYouLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(orderNumber)
        orderNumber.anchor(top: thankYouLabel.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 15, paddingLeft: 37, paddingRight: 0, paddingBottom: 0, width: 85, height: 25)
        
        view.addSubview(orderNumberValue)
        orderNumberValue.anchor(top: thankYouLabel.bottomAnchor, left: orderNumber.trailingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 15, paddingLeft: 37, paddingRight: 0, paddingBottom: 0, width: 0, height: 25)
        
        view.addSubview(deliveryInfo)
        deliveryInfo.anchor(top: orderNumberValue.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 15, paddingLeft: 37, paddingRight: 0, paddingBottom: 0, width: 110, height: 25)
        
        view.addSubview(deliveryInfoValue)
        deliveryInfoValue.anchor(top: orderNumberValue.bottomAnchor, left: orderNumber.trailingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 15, paddingLeft: 37, paddingRight: 0, paddingBottom: 0, width: 0, height: 25)
        
        view.addSubview(homePage)
        homePage.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 37, paddingRight: 37, paddingBottom: 40, width: 0, height: 46)
//
        view.addSubview(tracking)
        tracking.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: homePage.topAnchor, paddingTop: 0, paddingLeft: 37, paddingRight: 37, paddingBottom: 15, width: 0, height: 46)
    }
    
    @objc func handleTrackingBtn() {
        
    }
    @objc func handleHomePage() {
        
    }
}
