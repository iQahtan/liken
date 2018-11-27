//
//  TimeTableView.swift
//  Liken
//
//  Created by Qahtan on 11/20/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class TimeCollectionView: UICollectionView {
    
    
    var selectedDate: Date? {
        didSet {
            
        }
    }
    let cellId = "cellId"
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.register(TimeCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        self.dataSource = self

       
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension TimeCollectionView: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TimeCollectionViewCell
        return cell
    }
    

    
}
