//
//  ByItemsCollectionView.swift
//  Liken
//
//  Created by Qahtan on 11/13/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ByItemsCollectionView: UICollectionView,UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let colors: [UIColor] = [.orange,.orange,.red,.blue,.cyan,.gray,.orange]
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = .clear
        self.isPagingEnabled = true
        self.contentInset = UIEdgeInsetsMake(4, 4, 4, 4)
        self.register(ByItemsCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupDelgate() {
        self.delegate = self
        self.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ByItemsCell
        cell.layer.cornerRadius = 12
        cell.layer.masksToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ByItemsCell{
            cell.isSelected = true
            print(cell.titleLabel.text)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 97, height: 73)
        return CGSize(width: 73, height: 107)
    }
}
