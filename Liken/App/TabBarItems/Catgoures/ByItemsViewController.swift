//
//  Catgouries.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ByItemsViewController: TembletTabBarViewController {
    
    
    let cellId = "cellId"
    let byItmesCollectionView : ByItemsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let stors = ByItemsCollectionView(frame:.zero, collectionViewLayout: layout)
        stors.tag = 0
        return stors
    }()
    let filtringView: UIView = {
        let vi = UIView()
        vi.backgroundColor = .blue
        return vi
    }()
    let filterButton: UIButton = {
        let btn = UIButton(type:.system)
        btn.backgroundColor = .yellow
        return btn
    }()
    let btn: UIButton = {
        let btn = UIButton(type:.system)
        btn.backgroundColor = .black
        return btn
    }()
    let verticalSaprator : UIView = {
        let seprator = UIView()
        seprator.backgroundColor = UIColor.rgb(red: 232, green: 232, blue: 232)
        return seprator
    }()
    let categoriesCollectionView: CategoriesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let stors = CategoriesCollectionView(frame:.zero, collectionViewLayout: layout)
        stors.backgroundColor  = .gray
        stors.tag = 1
        return stors
    }()
    let selector: UIView = {
        let selector = UIView()
        selector.backgroundColor = UIColor(named: "green")
        return selector
    }()
    let itemsExpanbleCollectionView: ItemsExpandbaleCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let stors = ItemsExpandbaleCollectionView(frame:.zero, collectionViewLayout: layout)
        stors.backgroundColor = .orange
        stors.tag = 2
        return stors
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCatgoriesCollectionView()
        setupFilterView()
    }
    func setupCatgoriesCollectionView() {
        view.addSubview(byItmesCollectionView)
        byItmesCollectionView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 105)
        byItmesCollectionView.contentInset = UIEdgeInsetsMake(4, 4, 4, 4)
        byItmesCollectionView.backgroundColor = UIColor(named: "NavColor")
        byItmesCollectionView.dataSource = self
//        byItmesCollectionView.isPagingEnabled = true
        byItmesCollectionView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    var selectorLeadingAnchore : NSLayoutConstraint?
    func setupFilterView() {
        view.addSubview(selector)
        
        selector.anchor(top: byItmesCollectionView.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 73, height: 3)
        selectorLeadingAnchore = selector.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        selectorLeadingAnchore?.isActive = true
        view.addSubview(filtringView)
        filtringView.anchor(top: byItmesCollectionView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 49)
        filtringView.addSubview(filterButton)
        filterButton.anchor(top: nil, left: filtringView.leadingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 20, paddingRight: 0, paddingBottom: 0, width: 44, height: 44)
        
        filterButton.centerYAnchor.constraint(equalTo: filtringView.centerYAnchor).isActive = true
        
        filtringView.addSubview(btn)
        btn.anchor(top: nil, left: filterButton.trailingAnchor, right: nil, bottom: nil, paddingTop: 0, paddingLeft: 8, paddingRight: 0, paddingBottom: 0, width: 44, height: 44)
        btn.centerYAnchor.constraint(equalTo: filtringView.centerYAnchor).isActive = true
        filtringView.addSubview(verticalSaprator)
        verticalSaprator.anchor(top: filtringView.topAnchor, left: btn.trailingAnchor, right: nil, bottom: filtringView.bottomAnchor, paddingTop: 0, paddingLeft: 8, paddingRight: 0, paddingBottom: 0, width: 1, height: 0)
        
        filtringView.addSubview(categoriesCollectionView)
        categoriesCollectionView.anchor(top: filtringView.topAnchor, left: verticalSaprator.trailingAnchor, right: filtringView.trailingAnchor, bottom: filtringView.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        self.view.addSubview(itemsExpanbleCollectionView)
        itemsExpanbleCollectionView.dataSource = self
        itemsExpanbleCollectionView.delegate = self
        
        itemsExpanbleCollectionView.anchor(top: filtringView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
}
extension ByItemsViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 10
        }else  if collectionView.tag == 1  {
            return 10
        }else {
            return 10
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ByItemsCell
            return cell
        }else   if collectionView.tag == 1  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.backgroundColor = .red
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            cell.backgroundColor = .gray
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            if let cell = collectionView.cellForItem(at: indexPath) as? ByItemsCell{
                cell.isSelected = true
                
                let x = (CGFloat(indexPath.row) * self.view.frame.width / 10) + 4
                print("x",x,"Cell" , cell.frame.origin.x)
                print(indexPath.row)
                print(self.view.frame.width)
                
                selectorLeadingAnchore?.constant = x - 4
                
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }else if collectionView.tag == 1 {
            
        }else {
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView.tag == 0 {
            let indexPaths = collectionView.indexPathsForSelectedItems
            for index in indexPaths! {
                if index.section == indexPath.section {
                    byItmesCollectionView.deselectItem(at: index, animated: true) // if want deselect previous selection
                    //return false  //if you do not want further selection
                }
            }
            return true
        }else if collectionView.tag == 1 {
            return true
        }else {
            return true
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
            return CGSize(width: 73, height: 97)
        }else if collectionView.tag == 1  {
            return CGSize(width: 40, height: 40)
        }else {
            return CGSize(width: self.view.frame.width / 2 - 16, height: 200)
        }
    }
}
