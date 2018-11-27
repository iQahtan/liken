//
//  Comparing.swift
//  Liken
//
//  Created by Qahtan on 11/24/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class Comparing: TembletTabBarViewController {
    
    let collection: UICollectionView = {
        let coll = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        coll.backgroundColor = .red
        return coll
    }()
    let itemsCount: UILabel = {
        let lab = UILabel()
        return lab
    }()
    let seprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        return vi
    }()
    let filterButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setAttributedTitle(NSAttributedString(string: "تصفية", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 11),NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 78, green: 78, blue: 78)]), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "filter").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.backgroundColor = .green
        btn.imageEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 40)
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 10)
//        btn.imageEdgeInsets = UIEdgeInsetsMake(<#T##top: CGFloat##CGFloat#>, <#T##left: CGFloat##CGFloat#>, <#T##bottom: CGFloat##CGFloat#>, <#T##right: CGFloat##CGFloat#>)
        return btn
    }()
    let verticalSeprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        return vi
    }()
    let itemsCountInfo : UILabel = {
        let lab = UILabel()
        lab.backgroundColor = .red
        lab.textAlignment = .center
        return lab
    }()
    var isExpanded = [Bool]()
    var expandedHeight : CGFloat = 294
    var notExpandedHeight : CGFloat = 44
    let cellId = "cellId"
    let scrolView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrolView)
        setupViews()

        isExpanded = Array(repeating: false, count: 10)
        view.addSubview(collection)
        collection.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        collection.register(ComperingCell.self, forCellWithReuseIdentifier: cellId)
//        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collection.delegate = self
        collection.dataSource = self
    }
    func setupViews() {
        let attrubitedString = NSMutableAttributedString(string: "لديك", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 12),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78)])
        attrubitedString.append(NSMutableAttributedString(string: " \(5) ", attributes: [NSAttributedStringKey.font :UIFont(name: "Tajawal-Medium", size: 15),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78) ]))
        attrubitedString.append(NSMutableAttributedString(string: "منتجات في سلتك", attributes: [NSAttributedStringKey.font :UIFont(name: "Tajawal-Medium", size: 12),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78) ]))
        itemsCount.attributedText = attrubitedString
        view.addSubview(itemsCount)
        itemsCount.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 16, paddingRight: 16, paddingBottom: 180, width: 0, height: 25)
        view.addSubview(filterButton)
        filterButton.anchor(top: view.layoutMarginsGuide.topAnchor, left: nil, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 16, paddingBottom: 0, width: 80, height: 25)
        filterButton.imageView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.addSubview(seprator)
        seprator.anchor(top: filterButton.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
        
        scrolView.anchor(top: seprator.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        scrolView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        scrolView.addSubview(itemsCountInfo)
        itemsCountInfo.anchor(top: scrolView.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 22)
//        itemsCountInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
        let attributedString = NSMutableAttributedString(string: "وجدنا", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 14),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78)])
        
        attributedString.append(NSAttributedString(string: "\(2)", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 22),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78)]))
        
        attributedString.append(NSMutableAttributedString(string: "منتجات مشتركة لدى كل الهايبرات", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 14),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78)]))
        itemsCountInfo.attributedText = attributedString
    }
}
extension Comparing: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ComperingCell
        cell.indexPath = IndexPath(item: indexPath.row, section: 0)
        cell.delegate = self
        cell.backgroundColor = .green
        return cell
    }
}
extension Comparing :UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width   - 16
        if isExpanded[indexPath.row] == true{
            return CGSize(width: cellWidth, height: expandedHeight)
        }else{
            return CGSize(width: cellWidth, height: notExpandedHeight)
        }
    }
}

extension Comparing:ExpandedCellDelegate{
    func topButtonTouched(indexPath: IndexPath) {
        let newIndex = IndexPath(item: indexPath.row, section: 0)
        isExpanded[indexPath.row] = !isExpanded[indexPath.row]
        print("dfdfdf",indexPath,isExpanded[indexPath.row])
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            DispatchQueue.main.async {
                self.collection.reloadItems(at: [indexPath])
            }
        }, completion: { success in
            print("success")
        })
    }
}
class LeftAlignedIconButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        contentHorizontalAlignment = .left
        let availableSpace = UIEdgeInsetsInsetRect(bounds, contentEdgeInsets)
        let availableWidth = availableSpace.width - imageEdgeInsets.right - (imageView?.frame.width ?? 0) - (titleLabel?.frame.width ?? 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: availableWidth / 2, bottom: 0, right: 0)
    }
}
