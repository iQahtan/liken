//
//  ComperingCell.swift
//  Liken
//
//  Created by Qahtan on 11/24/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
protocol ExpandedCellDelegate:NSObjectProtocol{
    func topButtonTouched(indexPath:IndexPath)
}
class ComperingCell: UICollectionViewCell {
    
    var delegate:ExpandedCellDelegate?
    var indexPath: IndexPath!
    let btn : UIButton = {
        let btn = UIButton(type: .system)
//        btn.addTarget(self, action: #selector(hffff), for: .touchUpInside)
        btn.backgroundColor = .red
        return btn
    }()
    let cellId = "cellId"
    let collectionView: UICollectionView = {
        let coll = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        coll.backgroundColor = .blue
        return coll
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(btn)
        btn.anchor(top: topAnchor, left: leadingAnchor, right: nil, bottom: nil, paddingTop: 4, paddingLeft: 4, paddingRight: 0, paddingBottom: 0, width: 44, height: 44)
        btn.addTarget(self, action: #selector(hffff), for: .touchUpInside)
        addSubview(collectionView)
        collectionView.anchor(top: btn.bottomAnchor, left: leadingAnchor, right: trailingAnchor, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    @objc func hffff() {
        print("hffff")
        if let delegate = self.delegate{
            delegate.topButtonTouched(indexPath: indexPath)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ComperingCell  :UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.width / 2 - 16
        return CGSize(width: width, height: 80)
    }
}
