//
//  AlSelal.swift
//  Liken
//
//  Created by Qahtan on 11/23/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class AlSelal: TembletTabBarViewController {
    
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewTitle = "السلال جاهزة"
        self.color = UIColor.rgb(red: 67, green: 151, blue: 255)
        self.textColor = UIColor.white
        setupTitle()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(AlselalCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
}
extension AlSelal: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//        cell.backgroundColor = .blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 16
        return CGSize(width: collectionView.frame.width / 2 - 16, height: width)
    }
    
}
