//
//  BaqatAltwfeer.swift
//  Liken
//
//  Created by Qahtan on 11/24/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class BaqatAltwfeer: TembletTabBarViewController {
    
    let cellId = "cellId"
    let itemscell2 = "itemscell2"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewTitle = "باقات التوفير"
        self.color = UIColor(named:"green")
        self.textColor = UIColor.white
        setupTitle()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(ItemsCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.register(ItemsCell2.self, forCellWithReuseIdentifier: itemscell2)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
}
extension BaqatAltwfeer: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 2 == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemscell2, for: indexPath) as! ItemsCell2
            cell.backgroundColor = .red
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemsCell
            cell.backgroundColor = .green
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2  - 16
        return CGSize(width: width, height: 200)
    }
}
