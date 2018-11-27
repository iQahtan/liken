//
//  EditeProfile.swift
//  Liken
//
//  Created by Qahtan on 11/23/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class EditeProfile: TempletViewController {
    
    
    let profileImage: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "031-user-1").withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = UIColor.rgb(red: 174, green: 174, blue: 174)
        btn.layer.cornerRadius = 44
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(handleImagePicker), for: .touchUpInside)
        return btn
    }()
    let name: UILabel = {
        let lab = UILabel()
        lab.text = "الإسم"
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        lab.textColor = UIColor.rgb(red: 174, green: 174, blue: 174)
        return lab
    }()
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Tajawal-Medium", size: 14)
        tf.textColor = UIColor.rgb(red: 123, green: 123, blue: 123)
        return tf
    }()
    let phoneNumber: UILabel = {
        let lab = UILabel()
        lab.text = "رقم الجوال"
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        lab.textColor = UIColor.rgb(red: 174, green: 174, blue: 174)
        return lab
    }()
    let phoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.font = UIFont(name: "Tajawal-Medium", size: 14)
        tf.textColor = UIColor.rgb(red: 123, green: 123, blue: 123)
        return tf
    }()
    let emailNumber: UILabel = {
        let lab = UILabel()
        lab.text = "البريد الإلكتروني"
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        lab.textColor = UIColor.rgb(red: 174, green: 174, blue: 174)
        return lab
    }()
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont(name: "Tajawal-Medium", size: 14)
        tf.textColor = UIColor.rgb(red: 123, green: 123, blue: 123)
        return tf
    }()
    lazy var controllers : [UIButton] = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(named: "green")
        btn.setAttributedTitle(NSAttributedString(string: "حفظ", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 15),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        btn.addTarget(self, action: #selector(sendToDatabase), for: .touchUpInside)
        btn.layer.cornerRadius = 23
        btn.tag = 0
        btn.layer.masksToBounds = true
        
        
        let logout = UIButton(type: .system)
        logout.backgroundColor = UIColor.white
        logout.setAttributedTitle(NSAttributedString(string: "تسجيل الخروج", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 15),NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 253, green: 108, blue: 82)]), for: .normal)
        btn.tag = 1
        logout.addTarget(self, action: #selector(sendToDatabase), for: .touchUpInside)
        logout.layer.cornerRadius = 23
        logout.layer.borderColor = UIColor.rgb(red: 253, green: 108, blue: 82).cgColor
        logout.layer.borderWidth = 3
        logout.layer.masksToBounds = true
        
        return [btn,logout]
    }()
    let stackView:  UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        return sv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.view.hideKeyboardWhenTappedAround()
//        self.view.dismissKeyboard()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "ملفي الشخصي"
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // name TF
        let bottomBorederName = CALayer()
        bottomBorederName.frame = CGRect(x: 0, y: self.nameTextField.frame.height, width: self.nameTextField.frame.width, height: 1)
        bottomBorederName.backgroundColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1).cgColor
        self.nameTextField.layer.insertSublayer(bottomBorederName, at: 0)
        // phone TF
        let bottomBorederphnoe = CALayer()
        bottomBorederphnoe.frame = CGRect(x: 0, y: self.phoneNumberTextField.frame.height, width: self.phoneNumberTextField.frame.width, height: 1)
        bottomBorederphnoe.backgroundColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1).cgColor
        self.phoneNumberTextField.layer.insertSublayer(bottomBorederphnoe, at: 0)
        // name TF
        let bottomBorederEmail = CALayer()
        bottomBorederEmail.frame = CGRect(x: 0, y: self.emailTextField.frame.height, width: self.emailTextField.frame.width, height: 1)
        bottomBorederEmail.backgroundColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1).cgColor
        self.emailTextField.layer.insertSublayer(bottomBorederEmail, at: 0)
    }
    func setupViews() {
        view.addSubview(profileImage)
        profileImage.anchor(top: view.layoutMarginsGuide.topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 20, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 88, height: 88)
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(name)
        name.anchor(top: profileImage.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 47, paddingRight: 0, paddingBottom: 0, width: 44, height: 20)

        view.addSubview(nameTextField)
        nameTextField.anchor(top: name.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 47, paddingRight: 47, paddingBottom: 0, width: 0, height: 47)
//
        view.addSubview(phoneNumber)
        phoneNumber.anchor(top: nameTextField.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 47, paddingRight: 0, paddingBottom: 0, width: 88, height: 20)
//
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.anchor(top: phoneNumber.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 47, paddingRight: 47, paddingBottom: 0, width: 0, height: 47)
//
        view.addSubview(emailNumber)
        emailNumber.anchor(top: phoneNumberTextField.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 47, paddingRight: 0, paddingBottom: 0, width: 120, height: 20)

        view.addSubview(emailTextField)
        emailTextField.anchor(top: emailNumber.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 47, paddingRight: 47, paddingBottom: 0, width: 0, height: 47)
        
        view.addSubview(stackView)
        for i in 0..<controllers.count {
            stackView.addArrangedSubview(controllers[i])
        }
        stackView.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 47, paddingRight: 47, paddingBottom: 60, width: 0, height: 46)
    }
    @objc func sendToDatabase(_ sender: UIButton) {
        print(sender.tag)
    }
    @objc func handleImagePicker() {
        let imagePicker = UIImagePickerController()
        self.present(imagePicker, animated: true, completion: nil)
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
}
extension EditeProfile : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            profileImage.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            profileImage.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
//        pluseButton.layer.cornerRadius = pluseButton.frame.width / 2
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor(named:"green")?.cgColor
//        print(pluseButton.image(for: .normal)?.size,"pluseButton.image(for: .normal)")
        dismiss(animated: true, completion: nil)
    }
}
