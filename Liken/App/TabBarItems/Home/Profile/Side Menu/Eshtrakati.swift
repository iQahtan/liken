//
//  Eshtrakati.swift
//  Liken
//
//  Created by Qahtan on 11/21/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class Eshtrakati: TempletViewController {
    
    let cellId = "cellId"
    let eshtrahatCollectionViwe: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.backgroundColor = .blue
        return collection
    }()
    let pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = UIColor.rgb(red: 117, green: 117, blue: 117)
        pc.pageIndicatorTintColor = UIColor.rgb(red: 201, green: 201, blue: 201)
        pc.addTarget(self, action: #selector(handlePageControllerTapped), for: .valueChanged)
        return pc
    }()
    let whiteView: UIView = {
        let vie = UIView()
//        vie.backgroundColor = .green
        return vie
    }()
    let info: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Questv1-Bold", size: 20)
        lab.text = "تفاصيل الباقة"
        lab.textColor = UIColor.rgb(red: 132, green: 132, blue: 132)
        return lab
    }()
    let descrip: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        lab.text = ":على ماذا ستحصل في هذه الباقة من مميزات"
        lab.textColor = UIColor.rgb(red: 255, green: 152, blue: 152)
        return lab
    }()
    let subscribBtn: UIButton = {
        let btn = UIButton(type: .system)
        let attrubitedString = NSMutableAttributedString(string: "قم بالإشتراك الآن", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 17),NSAttributedStringKey.foregroundColor:UIColor.white])
        btn.setAttributedTitle(attrubitedString, for: .normal)
        btn.backgroundColor = UIColor(named:"green")

        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    func setupViews() {
        view.backgroundColor = UIColor.rgb(red: 248, green: 248, blue: 248)
        eshtrahatCollectionViwe.contentInset = UIEdgeInsetsMake(0, 8, 0, 8)
        eshtrahatCollectionViwe.delegate = self
        eshtrahatCollectionViwe.dataSource = self
        eshtrahatCollectionViwe.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(whiteView)
        whiteView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 4, paddingRight: 4, paddingBottom: 0, width: 0, height: 250)
        
        whiteView.addSubview(eshtrahatCollectionViwe)
        eshtrahatCollectionViwe.anchor(top: nil, left: whiteView.leadingAnchor, right: whiteView.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 200)
        eshtrahatCollectionViwe.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor).isActive = true
        
        whiteView.addSubview(pageController)
        pageController.anchor(top: nil, left: nil, right: nil, bottom: whiteView.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 8, width: 200, height: 20)
        pageController.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        pageController.numberOfPages = 4
        
        view.addSubview(info)
        info.anchor(top: whiteView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 20, paddingRight: 0, paddingBottom: 0, width: 0, height: 25)
        view.addSubview(descrip)
        descrip.anchor(top: info.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 20, paddingRight: 0, paddingBottom: 0, width: 0, height: 25)
        
        view.addSubview(subscribBtn)
        subscribBtn.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 36, paddingRight: 36, paddingBottom: 36, width: 0, height: 42)
        subscribBtn.layer.cornerRadius = 21
        subscribBtn.layer.masksToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "الإشتراكات"
        self.navigationItem.backBarButtonItem?.title = " "
    }
    @objc func handlePageControllerTapped(_ sender: UIPageControl){
        print(sender.currentPage)
    }
}
extension Eshtrakati : UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4 
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 192, height: 192)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.isSelected = true
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageController.currentPage = indexPath.row
        }
    }
}
