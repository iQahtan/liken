//
//  Stores.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class Stores: TembletTabBarViewController {
    
    let storesCollectionView : StoresCollectioView = {
        let layout = UICollectionViewFlowLayout()
        let stors = StoresCollectioView(frame: .zero, collectionViewLayout: layout)
        stors.backgroundColor = .green
        return stors
    }()
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTitle = "Hello"
        color = UIColor.rgb(red: 85 , green: 205 , blue: 138)
        textColor = UIColor.rgb(red: 88, green: 88, blue: 88)
        setupTitle()
        view.addSubview(storesCollectionView)
        storesCollectionView.anchor(top: label.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 10, paddingLeft: 8, paddingRight: 8, paddingBottom: 8, width: 0, height: 0)
//        storesCollectionView.register(StoresCell.self, forCellWithReuseIdentifier: cellId)
        storesCollectionView.delegate = self
        storesCollectionView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
extension Stores: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Stores")
        return 5 // return array of stores
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StoresCell
        print("Stores")
        cell.backgroundColor = .black
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 20, height: 180)
    }
}
