//
//  DeliveryTimes.swift
//  Liken
//
//  Created by Qahtan on 11/19/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class DeliveryTimes: TempletViewController {
    let dateCollectionView : DateCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let dateCollectionView = DateCollectionView(frame: .zero, collectionViewLayout: layout)
        dateCollectionView.tag = 0
        return dateCollectionView
    }()
    let titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "اختر وقت التوصيل"
        lab.textAlignment = .right
        lab.textColor = UIColor.rgb(red: 120, green: 120, blue: 120)
        lab.font = UIFont(name: "Tajawal-Medium", size: 16)
        return lab
    }()
    lazy var timeColletcionView: TimeCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let timeColletcionView = TimeCollectionView(frame: .zero, collectionViewLayout: layout)
        timeColletcionView.backgroundColor = .clear
        timeColletcionView.delegate = self
        timeColletcionView.tag = 1
        return timeColletcionView
    }()
    let conformBtn: UIButton = {
        let btn = UIButton(type: .system)
        let attributedString = NSMutableAttributedString(string: "تأكيد وقت التوصيل", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Bold", size: 20),NSAttributedStringKey.foregroundColor: UIColor.white ])
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.backgroundColor = UIColor(named: "green")
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "أوقات التوصيل"
        self.tabBarController?.tabBar.isHidden = true
        setupDateCollectioView()
        setupNavigationBar(image: #imageLiteral(resourceName: "Group 5"))
        setupTableView()
    }
    func setupDateCollectioView() {
        view.addSubview(dateCollectionView)
        dateCollectionView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 120)
        dateCollectionView.delegate = self
        dateCollectionView.layer.masksToBounds = false
        dateCollectionView.layer.shadowColor = UIColor.black.cgColor
        dateCollectionView.layer.shadowOpacity = 0.2
        dateCollectionView.layer.shadowOffset = CGSize(width: -1, height: 1)
        dateCollectionView.layer.shadowRadius = 1
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: dateCollectionView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 20, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 30)
        
    }
    func setupTableView() {
        view.addSubview(timeColletcionView)
        timeColletcionView.anchor(top: titleLabel.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 20, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 300)
        
        view.addSubview(conformBtn)
        conformBtn.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 20, paddingRight: 20, paddingBottom: 40, width: 0, height: 50)
        conformBtn.layer.cornerRadius = 25
        conformBtn.layer.masksToBounds = true
    }
    var selectedDate: Date?
}
extension DeliveryTimes: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
            return CGSize(width: 90, height: 90)
        }else {
            let width = collectionView.frame.width
            return CGSize(width: width , height: 63)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            if let cell = collectionView.cellForItem(at: indexPath) as? DateCell{
                cell.isSelected = true
                selectedDate = cell.date
                print(selectedDate)
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }else {
            if let cell = collectionView.cellForItem(at: indexPath) as? TimeCollectionViewCell{
                cell.isSelected = true
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
}
extension DeliveryTimes: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
