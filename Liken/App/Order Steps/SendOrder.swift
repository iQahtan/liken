//
//  SendOrder.swift
//  Liken
//
//  Created by Qahtan on 11/21/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class  SendOrder: TempletViewController {
    let mainScrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    let address: UILabel = {
        let lab = UILabel()
        lab.text = "عنوان التوصيل"
//        lab.backgroundColor = .black
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let adressButton: CustomView = {
        let customView = CustomView()
        return customView
    }()
    let seprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        vi.layer.opacity = 0.05
        return vi
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.dismissKeyboard()
        setupAddressViews()
        setupDeliveryTime()
        setupAviliblty()
        setupPaymentMethods()
        setupDeliveryNote()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "ارسال الطلب"
    }
    func setupAddressViews(){
        
        view.addSubview(mainScrollView)
        mainScrollView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        mainScrollView.contentSize = CGSize(width: self.view.frame.width, height: 1100)
        
        mainScrollView.addSubview(address)
        address.anchor(top: mainScrollView.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 17, paddingLeft: 25, paddingRight: 0, paddingBottom: 0, width: 110, height: 25)
        
        mainScrollView.addSubview(adressButton)
        adressButton.anchor(top: address.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 14, paddingLeft: 25, paddingRight: 25, paddingBottom: 0, width: 0, height: 47)
        
        adressButton.pricLabel.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleAddressBtn))
        adressButton.addGestureRecognizer(tap)
        
        mainScrollView.addSubview(seprator)
        seprator.anchor(top: adressButton.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 17, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
    }
    let deliveryInfo: UILabel = {
        let lab = UILabel()
        lab.text = "وقت التوصيل"
//        lab.backgroundColor = .black
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let deliveryButton: CustomView = {
        let customView = CustomView()
        return customView
    }()
    let deliverySeprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        vi.layer.opacity = 0.05
        return vi
    }()
    func setupDeliveryTime() {
        mainScrollView.addSubview(deliveryInfo)
        deliveryInfo.anchor(top: seprator.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 17, paddingLeft: 25, paddingRight: 0, paddingBottom: 0, width: 110, height: 25)
        
        mainScrollView.addSubview(deliveryButton)
        deliveryButton.anchor(top: deliveryInfo.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 14, paddingLeft: 25, paddingRight: 25, paddingBottom: 0, width: 0, height: 47)
        mainScrollView.addSubview(deliverySeprator)
        deliverySeprator.anchor(top: deliveryButton.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 17, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDeleivryDateBtn))
        deliveryButton.addGestureRecognizer(tap)
    }
    let avilibltyInfo: UILabel = {
        let lab = UILabel()
        lab.text = "عند عدم توفر المنتج، هل:"
//        lab.backgroundColor = .black
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    lazy var avilibltyMethods: [CheckBox] = {
        let replace = CheckBox(type: .system)
        replace.lab.text = "استبدل"
        replace.addTarget(self, action: #selector(handleAvilibltyChosess), for: .touchUpInside)
        replace.tag = 0
        
        let dontReplace = CheckBox(type: .system)
        dontReplace.lab.text = "لا تستبدل"
        dontReplace.addTarget(self, action: #selector(handleAvilibltyChosess), for: .touchUpInside)
        dontReplace.tag = 1
        
        let matchesBtn = CheckBox(type: .system)
        matchesBtn.lab.text = "مشابه"
        matchesBtn.addTarget(self, action: #selector(handleAvilibltyChosess), for: .touchUpInside)
        matchesBtn.tag = 2
        return [replace,dontReplace,matchesBtn]
    }()
    let avilibltyStackView:UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    let avilibltySeprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        vi.layer.opacity = 0.05
        return vi
    }()
    func setupAviliblty() {
        mainScrollView.addSubview(avilibltyInfo)
        avilibltyInfo.anchor(top: deliverySeprator.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 17, paddingLeft: 25, paddingRight: 0, paddingBottom: 0, width: 184, height: 25)
        mainScrollView.addSubview(avilibltyStackView)
        avilibltyStackView.anchor(top: avilibltyInfo.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 14, paddingLeft: 25, paddingRight: 25, paddingBottom: 0, width: 0, height: 47)
        
        for button in 0..<avilibltyMethods.count {
            avilibltyStackView.addArrangedSubview(avilibltyMethods[button])
        }
        mainScrollView.addSubview(avilibltySeprator)
        avilibltySeprator.anchor(top: avilibltyStackView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 17, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
    }
    let paymentInfo: UILabel = {
        let lab = UILabel()
        lab.text = "طريقة الدفع"
//        lab.backgroundColor = .black
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    lazy var paymentMethods: [ImageBtn] = {
        let cash = ImageBtn(type: .system)

        cash.setImage(#imageLiteral(resourceName: "Group 64").withRenderingMode(.alwaysOriginal), for: .normal)
        cash.addTarget(self, action: #selector(hanldePaymentChosess), for: .touchUpInside)
        cash.tag = 0
        cash.imageView?.contentMode = .scaleAspectFit
        cash.clipsToBounds = true
        let mada = ImageBtn(type: .system)

        mada.setImage(#imageLiteral(resourceName: "mada").withRenderingMode(.alwaysOriginal), for: .normal)
        mada.addTarget(self, action: #selector(hanldePaymentChosess), for: .touchUpInside)
        mada.imageView?.contentMode = .scaleAspectFit
        mada.clipsToBounds = true
        mada.tag = 1
        
        let visa = ImageBtn(type: .system)
        visa.imageView?.contentMode = .scaleAspectFit
        visa.clipsToBounds = true
        visa.setImage(#imageLiteral(resourceName: "visa").withRenderingMode(.alwaysOriginal), for: .normal)
        visa.addTarget(self, action: #selector(hanldePaymentChosess), for: .touchUpInside)
        visa.tag = 2
        return [cash,mada,visa]
    }()
    let paymentStackView:UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 5
        sv.distribution = .fillEqually
        return sv
    }()
    let paymentSeprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        vi.layer.opacity = 0.05
        return vi
    }()
    func setupPaymentMethods() {
        mainScrollView.addSubview(paymentInfo)
        paymentInfo.anchor(top: avilibltySeprator.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 17, paddingLeft: 25, paddingRight: 0, paddingBottom: 0, width: 184, height: 25)
        mainScrollView.addSubview(paymentStackView)
        paymentStackView.anchor(top: paymentInfo.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 14, paddingLeft: 25, paddingRight: 25, paddingBottom: 0, width: 0, height: 47)
        
        mainScrollView.addSubview(paymentSeprator)
        paymentSeprator.anchor(top: paymentStackView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 17, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
        
        for button in 0..<paymentMethods.count {
            paymentStackView.addArrangedSubview(paymentMethods[button])
        }
    }
    let deliveryNoteInfo: UILabel = {
        let lab = UILabel()
        lab.text = "ملاحظتك للمندوب"
//        lab.backgroundColor = .black
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let deliveryNote: UITextView = {
        let tv = UITextView()
        tv.text = "مثال: لا تدق الجرس لأنه لا يعمل"
        tv.font = UIFont(name: "Tajawal-Medium", size: 14)
        tv.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        tv.layer.borderWidth = 2
        tv.layer.cornerRadius = 6
        tv.layer.borderColor = UIColor.rgb(red: 228, green: 228, blue: 228).cgColor
        return tv
    }()
    let deliveryNoteSeprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        vi.layer.opacity = 0.05
        return vi
    }()
    let walletChoecess: UILabel = {
        let lab = UILabel()
//        lab.backgroundColor = .black
        return lab
    }()
    let swatch: UISwitch = {
        let s = UISwitch()
        s.tintColor = UIColor.rgb(red: 183, green: 183, blue: 183)
        s.onTintColor = UIColor.rgb(red: 86, green: 205, blue: 139)
        return s
    }()
    let walletSeprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        vi.layer.opacity = 0.05
        return vi
    }()
    
    let coupnInfo: UILabel = {
        let lab = UILabel()
        lab.text = "لديك كوبون؟ "
//        lab.backgroundColor = .black
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let couponTF: CustomTF = {
        let tf = CustomTF()
        tf.layer.borderColor = UIColor.rgb(red: 228, green: 228, blue: 228).cgColor
        tf.layer.cornerRadius = 6
        tf.backgroundColor = .white
        tf.layer.borderWidth = 2
        tf.font = UIFont(name: "Tajawal-Medium", size: 14)
        tf.rightViewMode = .always
        tf.clipsToBounds = true
        tf.placeholder = "أدخل كوبون الخصم"
        return tf
    }()
    
    let couponSeprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        vi.layer.opacity = 0.88
        return vi
    }()
    let checkoutView: CheckOutView = {
        let ch = CheckOutView()
        return ch
    }()
    func setupDeliveryNote() {
        mainScrollView.addSubview(deliveryNoteInfo)
        deliveryNoteInfo.anchor(top: paymentSeprator.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 17, paddingLeft: 25, paddingRight: 0, paddingBottom: 0, width: 184, height: 25)
        
        mainScrollView.addSubview(deliveryNote)
        deliveryNote.anchor(top: deliveryNoteInfo.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 14, paddingLeft: 25, paddingRight: 25, paddingBottom: 0, width: 0, height: 71)
     
        mainScrollView.addSubview(deliveryNoteSeprator)
        deliveryNoteSeprator.anchor(top: deliveryNote.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 17, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
        
//----------
        mainScrollView.addSubview(walletChoecess)
        walletChoecess.anchor(top: deliveryNoteSeprator.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 17, paddingLeft: 25, paddingRight: 0, paddingBottom: 0, width: 245, height: 25)
        setupAttrubitedString(string: "استخدم رصيد محفظتي أولاً", lab: walletChoecess)
        mainScrollView.addSubview(swatch)
        swatch.anchor(top: nil, left: nil, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 25, paddingBottom: 0, width:49 , height: 31)
        swatch.centerYAnchor.constraint(equalTo: walletChoecess.centerYAnchor).isActive = true
        
        mainScrollView.addSubview(walletSeprator)
        walletSeprator.anchor(top: walletChoecess.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 17, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
        mainScrollView.addSubview(coupnInfo)
        coupnInfo.anchor(top: walletSeprator.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 17, paddingLeft: 25, paddingRight: 0, paddingBottom: 0, width: 184, height: 25)
        
        mainScrollView.addSubview(couponTF)
        couponTF.anchor(top: coupnInfo.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 14, paddingLeft: 25, paddingRight: 25, paddingBottom: 0, width: 0, height: 47)
        
        let button = UIButton(type: .custom)
//        button.setImage(UIImage(named: "send.png"), for: .normal)
        button.backgroundColor = UIColor.rgb(red: 67, green: 151, blue: 255)
        button.setAttributedTitle(NSAttributedString(string: "تطبيق", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 14),NSAttributedStringKey.foregroundColor:UIColor.white]), for: .normal)
                button.frame = CGRect(x: CGFloat(couponTF.frame.size.width - 25), y: CGFloat(5), width: CGFloat(72), height: CGFloat(47))
        button.addTarget(self, action: #selector(self.applyCuopon), for: .touchUpInside)
        couponTF.rightView = button
        couponTF.rightViewMode = .always
        
        
// -------
        mainScrollView.addSubview(couponSeprator)
        couponSeprator.anchor(top: couponTF.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 17, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
        
        mainScrollView.addSubview(checkoutView)
        checkoutView.anchor(top: couponSeprator.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 14, paddingLeft: 25, paddingRight: 25, paddingBottom: 0, width: 0, height: 203)
        checkoutView.chekoutButton.addTarget(self, action: #selector(handleCheckout), for: .touchUpInside)
    }
    func setupAttrubitedString(string:String,lab:UILabel) {
        let attributedString = NSMutableAttributedString(string: string, attributes: [NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 120, green: 120, blue: 120),NSAttributedStringKey.font:UIFont(name: "Tajawal-Medium", size: 15)])
        attributedString.append(NSMutableAttributedString(string: "(\(200 )SR) ", attributes: [NSAttributedStringKey.foregroundColor :UIColor.rgb(red: 86, green: 206, blue: 139),NSAttributedStringKey.font: UIFont(name:"Tajawal-Medium", size: 15) ]))
        lab.attributedText = attributedString
        
    }
    @objc func handleAddressBtn() {
        print("dsdssd")
        let address = AdressViewController()
        self.navigationController?.pushViewController(address, animated: true)
    }
    @objc func handleDeleivryDateBtn() {
        print("dsdssd")
        let dateViewControler = DeliveryTimes()
        self.navigationController?.pushViewController(dateViewControler, animated: true)
    }
    @objc func handleCheckout() {
        print("122232")
        let lastStepOfOrder = LastStepOfOrder()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(lastStepOfOrder, animated: true)
        
    }
    @objc func applyCuopon() {
        print("12333")
    }
    @objc func handleAvilibltyChosess(_ sender:CheckBox) {
        sender.isChecked = !sender.isChecked
        for i in 0..<avilibltyMethods.count {
            if sender.tag != avilibltyMethods[i].tag{
                 avilibltyMethods[i].isChecked = false
            }
        }
    }
    @objc func hanldePaymentChosess(_ sender: ImageBtn) {
        sender.isChecked = !sender.isChecked
        for i in 0..<paymentMethods.count {
            if sender.tag != paymentMethods[i].tag{
                paymentMethods[i].isChecked = false
            }
        }
    }
    
}
class CustomView:UIView {
    
    let greenColor = UIColor.rgb(red: 86, green: 206, blue: 139)
    
    let textLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        lab.text = "الرياض، السعادة، مخرج 15"
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    let smallButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "Group 5"), for: .normal)
        return btn
    }()
    let pricLabel: UILabel = {
        let lab = UILabel()
        lab.text = "11 SR"
        lab.font = UIFont(name: "Tajawal-Bold", size: 15)
        //        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews() {
        self.addSubview(pricLabel)
        self.addSubview(textLabel)
        self.addSubview(smallButton)
        textLabel.anchor(top: nil, left: self.leadingAnchor, right: pricLabel.leadingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 17, paddingRight: 8, paddingBottom: 0, width: 0, height: 19)
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        pricLabel.textColor = greenColor
        layer.borderColor = greenColor.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 6
        layer.masksToBounds = true
        
        
        smallButton.anchor(top: nil, left: nil, right: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 17, paddingBottom: 0, width: 22, height: 22)
        smallButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pricLabel.anchor(top: nil, left: nil, right: smallButton.leadingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 10, paddingBottom: 0, width: 35, height: 22)
        pricLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class ImageBtn: UIButton  {
    var isChecked : Bool = false {
        didSet {
            if isChecked == true {
                self.layer.borderColor = UIColor.rgb(red: 101, green: 209, blue: 148).cgColor
                self.layer.borderWidth = 2
                
            }else {
                self.layer.borderWidth = 0
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomTF: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
