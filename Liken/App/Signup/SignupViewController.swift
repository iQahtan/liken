//
//  SignupViewController.swift
//  Liken
//
//  Created by Qahtan on 11/11/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    var phoneNumber: String?
    let maxNumberOfCharacters = 9
    let image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "sample_bg5")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    var stackView: UIStackView!
    let phoneKey:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("+996", for: .normal)
        btn.backgroundColor = .yellow
        btn.tintColor = UIColor.rgb(red: 95, green: 95, blue: 95)
        btn.addTarget(self, action: #selector(handlePhoneKey), for: .touchUpInside)
        return btn
    }()
    let numberTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "رقم الجوال"
        tf.keyboardType = .numberPad
        tf.font = UIFont(name: "Tajawal-Regular", size: 19)
        tf.textColor = UIColor.rgb(red: 95, green: 95, blue: 95)
        return tf
    }()
    let signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(named:"green")
        let attributedString = NSMutableAttributedString(string: NSLocalizedString("signup",comment:""), attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont(name: "Questv1-Bold", size: 17.0)])
        btn.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        btn.setAttributedTitle(attributedString, for: .normal)
        return btn
    }()
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "logo-dark")
        return iv
    }()
    let logoLabel: UILabel = {
        let lab = UILabel()
        lab.text = "قارن واشتري"
        lab.textAlignment = .center
        lab.font = UIFont(name: "Questv1-Bold", size: 18)
        lab.textColor = UIColor(named: "labelTextColor")
        return lab
    }()
    let gradinteView: UIView = {
        let view = UIView()
        return view
    }()
    let sapretor: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 213, green: 213, blue: 213)
        return view
    }()
    let orLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = NSLocalizedString("orVia", comment: "")
        label.backgroundColor = .white
        label.textColor = UIColor(named:"labelTextColor")
        label.font = UIFont(name: "Tajawal-Medium", size: 13.0)
        return label
    }()
    let socialMediaIcons : [UIImage] = {
        let google = #imageLiteral(resourceName: "Path 51")
        let facebook = #imageLiteral(resourceName: "Facebook")
        let twitter = #imageLiteral(resourceName: "Twitter")
        return [google,facebook,twitter]
    }()
    let bottomButtons: [UIButton]={
        let userType2 = UIButton(type: .system)
        userType2.backgroundColor = UIColor(named: "green")
        let attributedString = NSMutableAttributedString(string: NSLocalizedString("signup",comment:""), attributes: [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont(name: "Tajawal-Regular", size: 15.0)])
        userType2.setAttributedTitle(attributedString, for: .normal)
        
        
        let vistor = UIButton(type: .system)
        vistor.backgroundColor = .white
        vistor.layer.borderColor = UIColor.rgb(red: 67, green: 151, blue: 255).cgColor
        vistor.layer.borderWidth = 1
        let attributedStringVistor = NSMutableAttributedString(string: NSLocalizedString("signup",comment:""), attributes: [NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 67, green: 151, blue: 255),NSAttributedStringKey.font:UIFont(name: "Tajawal-Regular", size: 15.0)])
        vistor.setAttributedTitle(attributedStringVistor, for: .normal)
        return [userType2,vistor]
    }()
    let socialMediaButtons :  UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        return stackView
    }()
    let bottomButtonsStackView :  UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setGradientBackground()
        setupLogoImage()
        setupPhnoenumberTextField()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func setupLogoImage() {
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, right: nil, bottom: nil, paddingTop: 130, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 150, height: 60)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(logoLabel)
        logoLabel.anchor(top: logoImageView.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 6, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 120, height: 30)
        logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func setupPhnoenumberTextField(){
        numberTextField.delegate = self
        stackView = UIStackView(arrangedSubviews: [numberTextField,phoneKey])
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.backgroundColor = .red
        stackView.distribution = .fillProportionally
        stackView.anchor(top: logoLabel.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 8, paddingLeft: 18, paddingRight: 18, paddingBottom: 0, width: 0, height: 50)
        
        view.addSubview(signUpButton)
        signUpButton.anchor(top: stackView.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 12, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 166, height: 42)
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.layer.cornerRadius = 21
        signUpButton.layer.masksToBounds = true
        
        view.addSubview(sapretor)
        view.addSubview(orLabel)
        orLabel.anchor(top: signUpButton.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 12, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 50, height: 15)
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(socialMediaButtons)
        
        for i in 0..<socialMediaIcons.count {
            let button = UIButton(type: .system)
            button.setImage(socialMediaIcons[i].withRenderingMode(.alwaysOriginal), for: .normal)
            print(i)
            socialMediaButtons.addArrangedSubview(button)
        }
        
        socialMediaButtons.anchor(top: orLabel.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 8, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 132, height: 40)
        socialMediaButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setupBottomButtons()
        
    }
    func setupBottomButtons() {
        view.addSubview(bottomButtonsStackView)
        bottomButtonsStackView.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 18, paddingRight: 18, paddingBottom: 40, width: 0, height: 46)
        
        for i in 0..<bottomButtons.count {
            bottomButtons[i].layer.cornerRadius = 23
            bottomButtonsStackView.addArrangedSubview(bottomButtons[i])
        }
    }
    override func viewDidLayoutSubviews() {
        let bottomBoreder = CALayer()
        bottomBoreder.frame = CGRect(x: 0, y: self.stackView.frame.height, width: self.stackView.frame.width, height: 1)
        bottomBoreder.backgroundColor = UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1).cgColor
        stackView.layer.insertSublayer(bottomBoreder, at: 0)
//
        sapretor.anchor(top: signUpButton.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 20, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: self.stackView.frame.width, height: 1)
        sapretor.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    @objc func handlePhoneKey() {
        print("handlePhoneKey")
        let countriesTV = CountriesTableView()
//        countriesTV.signupVC = self
        let navC = UINavigationController(rootViewController: countriesTV)
        
        present(navC, animated: true, completion: nil)
    }
    func setGradientBackground() {
        view.addSubview(image)
        image.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 150)

        view.addSubview(gradinteView)
        gradinteView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 190)

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradinteView.frame
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.0, 0.8,1.0]
        gradinteView.layer.insertSublayer(gradientLayer, at: 0)
//        image.addSubview(gra/dinteView)
    }
    // Selectors
    @objc func handleSignup() {
        print(123)
        let activition = ActivitionCode()
        activition.phone = phoneNumber
        activition.counterCode = phoneKey.titleLabel?.text
        self.navigationController?.pushViewController(activition, animated: true)
    }
}
extension Collection {
    public func chunk(n: IndexDistance) -> [SubSequence] {
        var res: [SubSequence] = []
        var i = startIndex
        var j: Index
        while i != endIndex {
            j = index(i, offsetBy: n, limitedBy: endIndex) ?? endIndex
            res.append(self[i..<j])
            i = j
        }
        return res
    }
}
extension String {
    func chunkFormatted(withChunkSize chunkSize: Int = 3,
                        withSeparator separator: Character = "-") -> String {
        return characters.filter { $0 != separator }.chunk(n: chunkSize)
            .map{ String($0) }.joined(separator: String(separator))
    }
}
extension SignupViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard string.characters.flatMap({ Int(String($0)) }).count ==
            string.characters.count else { return false }
        
        let text = textField.text ?? ""
        
        if string.characters.count == 0 {
            textField.text = String(text.characters.dropLast()).chunkFormatted()
        }
        else {
            let newText = String((text + string).characters
                .filter({ $0 != "-" }).prefix(maxNumberOfCharacters))
            textField.text = newText.chunkFormatted()
            phoneNumber = newText.chunkFormatted()
        }
        return false
    }
}
