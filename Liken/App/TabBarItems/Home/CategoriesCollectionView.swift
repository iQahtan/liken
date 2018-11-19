//
//  CategoriesCollectionView.swift
//  Liken
//
//  Created by Qahtan on 11/13/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class CategoriesCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    var expanble: ItemsExpandbaleCollectionView?
    let titles : [String] = [NSLocalizedString("juses  ",comment:""),
                             NSLocalizedString("feshWater  ",comment:""),
                             NSLocalizedString("tie   ",comment:""),
                             NSLocalizedString("shoppingByItems  ",comment:""),
                             NSLocalizedString("shoppingByItems  ",comment:""),
                             NSLocalizedString("shoppingByItems  ",comment:"")]
    let cellId = "cellId"
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.allowsMultipleSelection = false
        self.allowsSelection = true
        self.contentInset = UIEdgeInsetsMake(4, 4, 4, 4)
        self.register(CategoriesCell.self, forCellWithReuseIdentifier: cellId)
    }
    func setupDelegates() {
        self.delegate = self
        self.dataSource = self
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoriesCell
        cell.titleLabel.text = titles[indexPath.row]
//        cell.backgroundColor = .blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let text = NSAttributedString(string: titles[indexPath.row], attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal Medium", size: 15.0),NSAttributedStringKey.foregroundColor: UIColor(named: "labelTextColor") ])
//        let text = NSAttributedString(string:titles[indexPath.row])
//        print("sizeForItem",)
        return CGSize(width: text.size().width, height: 32)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoriesCell{
            cell.isSelected = true
//            TAKE THE ITEMS FROM THE CATUGRES
//            self.expanble?.items =
            print(cell.titleLabel.text)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
//    shouldsele
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let indexPaths = collectionView.indexPathsForSelectedItems
        for index in indexPaths! {
            if index.section == indexPath.section {
                self.deselectItem(at: index, animated: true) // if want deselect previous selection
                //return false  //if you do not want further selection
            }
        }
        return true
    }
}
