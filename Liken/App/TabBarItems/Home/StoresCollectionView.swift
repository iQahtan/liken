//
//  StoresCollectionView.swift
//  Liken
//
//  Created by Qahtan on 11/12/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class StoresCollectioView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    let images : [UIImage] = [#imageLiteral(resourceName: "cbe8fe17095d9230bef372996665a954"),#imageLiteral(resourceName: "lulu-promotions-riyadh-27-feb-2017-3orod-logo-300x300"),#imageLiteral(resourceName: "07VIdptA"),#imageLiteral(resourceName: "carrefour"),#imageLiteral(resourceName: "image_1456_ar"),#imageLiteral(resourceName: "othaim")]
    let cellId = "cellId"
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(StoresCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    func setupDelgate() {
        self.backgroundColor = .clear
        self.isPagingEnabled = true
        self.delegate = self
        self.dataSource = self
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StoresCell
        cell.image.image = images[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
