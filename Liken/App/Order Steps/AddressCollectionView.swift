//
//  AddressCollectionView.swift
//  Liken
//
//  Created by Qahtan on 11/23/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class AddressCollectionView: UICollectionView,UICollectionViewDataSource {
    
    let cellId = "cellId"
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = self
        self.register(AddressCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AddressCollectionViewCell
        return cell
    }
}
