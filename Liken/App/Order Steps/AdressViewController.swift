//
//  AdressViewController.swift
//  Liken
//
//  Created by Qahtan on 11/22/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class AdressViewController: TempletViewController {
    
    
    let chocessAddress: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 16)
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        lab.text = "إختر عنوان توصيل"
        return lab
    }()
    let addAddress: UIButton = {
        let btn = UIButton(type: .system)
        btn.setAttributedTitle(NSAttributedString(string: "أضف عنوان جديد", attributes: [NSAttributedStringKey.font :UIFont(name: "Tajawal-Bold", size: 20),NSAttributedStringKey.foregroundColor: UIColor.white]), for: .normal)
        btn.backgroundColor = UIColor.rgb(red: 86, green: 206, blue: 139)
        return btn
    }()
    lazy var  addressCollectionView: AddressCollectionView = {
        let layout  = UICollectionViewFlowLayout()
        let addressCollectionView = AddressCollectionView(frame: .zero, collectionViewLayout: layout)
        addressCollectionView.delegate = self
        addressCollectionView.contentInset = UIEdgeInsetsMake(4, 8, 4, 8)
        addressCollectionView.backgroundColor = .white
        return addressCollectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "عناوين التوصيل"
        view.addSubview(chocessAddress)
        chocessAddress.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 31, paddingLeft: 41, paddingRight: 0, paddingBottom: 0, width: 150, height: 22)
        view.addSubview(addAddress)
        addAddress.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 41, paddingRight: 41, paddingBottom: 41, width: 0, height: 46)
        addAddress.layer.cornerRadius = 23
        addAddress.layer.masksToBounds = true
        
        view.addSubview(addressCollectionView)
        addressCollectionView.anchor(top: chocessAddress.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: addAddress.topAnchor, paddingTop: 13, paddingLeft: 41, paddingRight: 41, paddingBottom: 20, width: 0, height: 0  )
    }
}
extension AdressViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  collectionView.frame.width - 16, height: 138)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DateCell{
            cell.isSelected = true
//            selectedDate = cell.date
//            print(selectedDate)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
