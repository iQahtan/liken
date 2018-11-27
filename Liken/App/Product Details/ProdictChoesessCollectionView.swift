//
//  ProdictChoesessCollectionView.swift
//  Liken
//
//  Created by Qahtan on 11/25/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ProdictChoesessCollectionView: UICollectionView {
    let cellId = "CellId"
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = self
        self.isScrollEnabled = false
        self.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .bottom)
        self.register(ProdictChoesessCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ProdictChoesessCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProdictChoesessCell
        if indexPath.row == 0 {
            cell.label.text = "خيارات المنتج"
        }
        return cell
    }
}
