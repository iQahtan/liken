//
//  ProfileViewController.swift
//  Liken
//
//  Created by Qahtan on 11/19/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ProfileViewController: UIViewController {
    let profileImage: CustomImageView = {
        let image = CustomImageView()
        image.backgroundColor = .red
        return image
    }()
    let customLabel: UILabel = {
        let lab = UILabel()
        lab.text = "اسم العميل "
        lab.textColor = .white
        lab.font = UIFont(name: "Tajawal-Medium", size: 20)
        return lab
    }()
    let customPhone: UILabel = {
        let lab = UILabel()
        lab.text = "+966 55 000 0000"
        lab.textColor = .white
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        return lab
    }()
    let profileButton: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.tintColor = .white
        profile.setAttributedTitle(NSAttributedString(string: "الملف الشخصي", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 0
        profile.setImage(#imageLiteral(resourceName: "user").withRenderingMode(.alwaysTemplate), for: .normal)
//        profile.setTitle("ggggg", for: .normal)
        
        return profile
    }()
    let trackingBtn: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.setImage( #imageLiteral(resourceName: "delivery").withRenderingMode(.alwaysTemplate), for: .normal)
        profile.tintColor = .white
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 1
        profile.setAttributedTitle(NSAttributedString(string: "تتبع الطلب", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        return profile
    }()
    let myOrdersBtn: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 2
        profile.setAttributedTitle(NSAttributedString(string: "طلباتي", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.setImage(  #imageLiteral(resourceName: "015-box").withRenderingMode(.alwaysTemplate), for: .normal)
        profile.tintColor = .white
        return profile
    }()
    let myWallet: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 3
        profile.setAttributedTitle(NSAttributedString(string: "محفظتي", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.setImage( #imageLiteral(resourceName: "013-wallet").withRenderingMode(.alwaysTemplate), for: .normal)
        profile.tintColor = .white
        return profile
    }()
    let eshtrakati: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 4
        profile.setAttributedTitle(NSAttributedString(string: "اشتراكاتي", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.setImage( #imageLiteral(resourceName: "022-gift").withRenderingMode(.alwaysTemplate), for: .normal)
        profile.tintColor = .white

        return profile
    }()
    let seprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = .white
        return vi
    }()
    let condtionBtn: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.tintColor = .white
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 5
        profile.setAttributedTitle(NSAttributedString(string: "الشروط والأحكام", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.setImage( #imageLiteral(resourceName: "user").withRenderingMode(.alwaysTemplate), for: .normal)
//        profile.labelTitle.text = "الشروط والأحكام"
        return profile
    }()
    let contactUsBtn: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.tintColor = .white
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 6
        profile.setAttributedTitle(NSAttributedString(string: "تواصل معنا", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.setImage(  #imageLiteral(resourceName: "035-chat").withRenderingMode(.alwaysTemplate), for: .normal)
        return profile
    }()
    let ratAppBtn: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.tintColor = .white
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 7
        profile.setAttributedTitle(NSAttributedString(string: "تقييم التطبيق", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.setImage( #imageLiteral(resourceName: "user").withRenderingMode(.alwaysTemplate), for: .normal)
        return profile
    }()
    let shearAppBtn: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.tintColor = .white
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        profile.tag = 8
        profile.setAttributedTitle(NSAttributedString(string:  "شارك التطبيق", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.setImage( #imageLiteral(resourceName: "043-share").withRenderingMode(.alwaysTemplate), for: .normal)
//        profile.labelTitle.text = "شارك التطبيق"
        return profile
    }()
    let seprator2: UIView = {
        let vi = UIView()
        vi.backgroundColor = .white
        return vi
    }()
    let logOutBtn: ImageButton = {
        let profile = ImageButton(type: .system)
        profile.tintColor = .white
        profile.tag = 9
        profile.setAttributedTitle(NSAttributedString(string:  "تسجيل الخروج", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 16),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        profile.setImage( #imageLiteral(resourceName: "user").withRenderingMode(.alwaysTemplate), for: .normal)
        profile.addTarget(self, action: #selector(hanleButtonTapped), for: .touchUpInside)
        return profile
    }()
    var vi: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        self.tabBarController?.tabBar.isHidden = true
//        setupGradientLayer()
//        let xPoint = self.view.frame.width - 50
        view.backgroundColor = UIColor.rgb(red: 86, green: 206, blue: 139)
//        vi = UIView(frame: CGRect(x: -xPoint, y: 73.6, width: self.view.frame.width, height: 588.8))
//        view.addSubview(vi)
//        vi.backgroundColor = .blue
        setupAllViews()
        setupSecondView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    let leftConstant:CGFloat = 68
    func setupAllViews() {
        view.addSubview(profileImage)
        profileImage.anchor(top: view.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 33, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 70, height: 70)
        profileImage.layer.cornerRadius = 35
        profileImage.layer.masksToBounds = true
        view.addSubview(customLabel)
        customLabel.anchor(top: profileImage.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 5, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 170, height: 20)
        view.addSubview(customPhone)
        customPhone.anchor(top: customLabel.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 5, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 170, height: 20)
        view.addSubview(profileButton)
        profileButton.anchor(top: customPhone.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 8, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        view.addSubview(trackingBtn)
        trackingBtn.anchor(top: profileButton.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        
        view.addSubview(myOrdersBtn)
        myOrdersBtn.anchor(top: trackingBtn.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        view.addSubview(myWallet)
        myWallet.anchor(top: myOrdersBtn.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        view.addSubview(eshtrakati)
        eshtrakati.anchor(top: myWallet.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
    }
    func setupSecondView() {
        view.addSubview(seprator)
        seprator.anchor(top: eshtrakati.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 75, paddingRight: 0, paddingBottom: 0, width: 100, height: 1)
        view.addSubview(condtionBtn)
        condtionBtn.anchor(top: seprator.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        view.addSubview(contactUsBtn)
        contactUsBtn.anchor(top: condtionBtn.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        view.addSubview(ratAppBtn)
        ratAppBtn.anchor(top: contactUsBtn.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        view.addSubview(shearAppBtn)
        shearAppBtn.anchor(top: ratAppBtn.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: leftConstant, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        view.addSubview(seprator2)
        seprator2.anchor(top: shearAppBtn.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 75, paddingRight: 0, paddingBottom: 0, width: 100, height: 1)
        
        view.addSubview(logOutBtn)
        logOutBtn.anchor(top: seprator2.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: 68, paddingRight: 0, paddingBottom: 0, width: 200, height: 35)
        
    }
    func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [UIColor.rgb(red: 86, green: 206, blue: 139).cgColor, UIColor.rgb(red: 60, green: 196, blue: 121).cgColor]
        gradientLayer.locations = [0.4,0.6]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    @objc func handleDissmis() {
        print("dismlsss")

    }
    @objc func hanleButtonTapped(_ sender: ImageButton) {
        print("ggg",sender.tag)
        self.navigationController?.isNavigationBarHidden = false
        switch sender.tag {
        case 0 :
            let editeProfile = EditeProfile()
            self.navigationController?.pushViewController(editeProfile, animated: true)
            break
        case 1 :
            let sendOrder = SendOrder()
            self.navigationController?.pushViewController(sendOrder, animated: true)
            break
        case 2:
            let myOrder = MyOrders()
            self.navigationController?.pushViewController(myOrder, animated: true)
            break
        case 4:
            let eshrakati = Eshtrakati()
            self.navigationController?.pushViewController(eshrakati, animated: true)
        default:
            return
        }
        
    }
}
class ImageButton: UIButton {
    let photo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    let labelTitle: UILabel = {
        let lab = UILabel()
        lab.textColor = .white
        lab.textAlignment = .right
        lab.font = UIFont(name: "Tajawal-Medium", size: 16)
        return lab
    }()
//    var title:
    override init(frame: CGRect) {
        super.init(frame: frame)
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            
            self.imageEdgeInsets = UIEdgeInsets(top: 10,left: 171,bottom: 4,right: 4)
            self.contentHorizontalAlignment = .right
            self.titleEdgeInsets = UIEdgeInsets(top: 10,left: 20,bottom: 4,right: 0)
            // The app is in right-to-left mode
        }else {
            self.imageEdgeInsets = UIEdgeInsets(top: 10,left: 4,bottom: 4,right: 171)
            self.contentHorizontalAlignment = .left
            self.titleEdgeInsets = UIEdgeInsets(top: 10,left: 0,bottom: 4,right: 20)
        }

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
