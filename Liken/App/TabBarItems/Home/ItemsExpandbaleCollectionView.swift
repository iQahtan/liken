//
//  ItemsExpandbaleCollectionView.swift
//  Liken
//
//  Created by Qahtan on 11/14/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ItemsExpandbaleCollectionView: UICollectionView , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    var items: [String]?
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.contentInset = UIEdgeInsetsMake(4, 4, 4, 4)
        self.register(ItemsCell.self, forCellWithReuseIdentifier: cellId)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupDelgates () {
        self.delegate = self
        self.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemsCell
        if indexPath.row % 2 == 0{
            cell.itemImage.image = #imageLiteral(resourceName: "Almarai_Juices_1.5L_ETQ_100-Grape_on_bottle")
        }else {
            cell.itemImage.image = #imageLiteral(resourceName: "Almarai_Juices_1.5L_ETQ_Strawberry-W-Pulp_on_bottle")
        }
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (items?.count)!
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.frame.width / 2 - 12, height: 200)
        print(size)
        return size
    }
}
