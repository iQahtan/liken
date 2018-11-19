//
//  ActivitionCode.swift
//  Liken
//
//  Created by Qahtan on 11/16/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ActivitionCode: TempletViewController {
    
    var resendTimer: Timer!
    var second:Double = 5
    var phone: String?
    var counterCode : String?
    let infoLabel: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 0
        lab.backgroundColor = .black
        lab.textAlignment = .center
        return lab
    }()
    let numberTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "كود التحقق"
        tf.keyboardType = .numberPad
        tf.font = UIFont(name: "Tajawal-Regular", size: 19)
        tf.textColor = UIColor.rgb(red: 95, green: 95, blue: 95)
        return tf
    }()
    let phoneNumberEdite : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("(Edit)", comment: ""), for: .normal)
        button.tintColor = UIColor.rgb(red: 174, green: 174, blue: 174)
        button.titleLabel?.font = UIFont(name: "Tajawal-Medium", size: 14)
        button.addTarget(self, action: #selector(handleEditePhoneNumber), for: .touchUpInside)
        return button
    }()
    let signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(named:"green")
        let attributedString = NSMutableAttributedString(string: NSLocalizedString("signup",comment:""), attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont(name: "Questv1-Bold", size: 17.0)])
        btn.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        btn.setAttributedTitle(attributedString, for: .normal)
        return btn
    }()
    let resendCode : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.rgb(red: 95, green: 95, blue: 95)
        button.titleLabel?.font = UIFont(name: "Tajawal-Medium", size: 12)
        button.isEnabled = false
        
        button.addTarget(self, action: #selector(handleResendCode), for: .touchUpInside)
        return button
    }()
    let timerLabel: UILabel = {
        let lab = UILabel()
        lab.text = "30 seconds"
        lab.font = UIFont(name: "Tajawal-Medium", size: 13.0)
        return lab
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setuInfoLabel()
        resendTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = .white
        self.navigationItem.title = NSLocalizedString("signupTitle", comment: "")
        
    }
    func setuInfoLabel() {
        guard let phoneNumber = phone else { return }
        guard let countryCode = counterCode else { return}
        print("Hello")
        let attrubitedString = NSMutableAttributedString(string: NSLocalizedString("activitionCode", comment: ""), attributes: [NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 95, green: 95, blue: 95),NSAttributedStringKey.font: UIFont(name: "Tajawal-Regular", size: 15.0)])
        attrubitedString.append(NSMutableAttributedString(string: "\n\n"))
        attrubitedString.append(NSMutableAttributedString(string:  "\(countryCode )- \(phoneNumber) ", attributes: [NSAttributedStringKey.font:UIFont(name: "Tajawal-Medium", size: 20.0),NSAttributedStringKey.foregroundColor:UIColor(named: "green")]))
        infoLabel.attributedText = attrubitedString
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 120, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 350, height: 60)
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive  = true
        
        view.addSubview(phoneNumberEdite)
        phoneNumberEdite.anchor(top: infoLabel.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 8, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 50, height: 25)
        phoneNumberEdite.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setupActivitionCodeTextField()
    }
    func setupActivitionCodeTextField() {
        
        view.addSubview(numberTextField)
        numberTextField.anchor(top: phoneNumberEdite.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 16, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 166, height: 42)
        numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view.addSubview(signUpButton)
        signUpButton.anchor(top: numberTextField.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 20, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 166, height: 42)
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.layer.cornerRadius = 21
        signUpButton.layer.masksToBounds = true
        setupResendCodeButton()
    }
    func setupResendCodeButton() {
        let stackView = UIStackView(arrangedSubviews: [timerLabel,resendCode])
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.anchor(top: signUpButton.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 20, paddingLeft: 18, paddingRight: 18, paddingBottom: 0, width:180, height: 25)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let title = NSLocalizedString("resendCode", comment: "")
        resendCode.setTitle(title, for: .normal)
    }
    @objc func runTimedCode() {
        second -= 1.0
        timerLabel.text = "\(Int(second)) seconds"
        if second == 1 {
            timerLabel.text = "\(Int(second)) second"
        }
        if second == 0 {
            resendTimer.invalidate()
            resendCode.isEnabled = true
            resendCode.setTitle(NSLocalizedString("resend", comment: ""), for: .normal)
            timerLabel.text = ""
        }
    }
    @objc func handleEditePhoneNumber() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func handleSignup() {
        
    }
    @objc func handleResendCode() {
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let bottomBoreder = CALayer()
        bottomBoreder.frame = CGRect(x: 0, y: self.numberTextField.frame.height, width: self.numberTextField.frame.width, height: 1)
        bottomBoreder.backgroundColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1).cgColor
        numberTextField.layer.insertSublayer(bottomBoreder, at: 0)
    }
    
}
