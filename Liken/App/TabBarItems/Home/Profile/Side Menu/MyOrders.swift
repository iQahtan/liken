//
//  EshtrakatCollectionViwe.swift
//  Liken
//
//  Created by Qahtan on 11/21/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class MyOrders: TempletViewController  {
    
    let cellId = "cellId"
    let ordersCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        cv.backgroundColor = .green
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    func setupViews() {
        title = "طلباتي"
        ordersCollectionView.dataSource = self
        ordersCollectionView.delegate = self
        ordersCollectionView.backgroundColor = .white
        
        view.addSubview(ordersCollectionView)
        ordersCollectionView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        ordersCollectionView.contentInset = UIEdgeInsetsMake(8, 0, 8, 0)
        ordersCollectionView.register(MyOrdersCell.self, forCellWithReuseIdentifier: cellId)
    }
}
extension MyOrders: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyOrdersCell
//        cell.bgColor = UIColor.rgb(red: 214, green: 255, blue: 232)
//        cell.textColor = UIColor.rgb(red: 86, green: 206, blue: 139)
//        cell.borderColor = UIColor.rgb(red: 86, green: 206, blue: 139).cgColor
//        cell.layer.masksToBounds = true
        cell.status = indexPath.row
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 36, height: 135)
    }
}
