//
//  HomeVC.swift
//  Liken
//
//  Created by Qahtan on 11/11/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class HomeVC: UIViewController,UIScrollViewDelegate,UINavigationControllerDelegate {
    let imageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    let mainScrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.isPagingEnabled = true
        return sv
    }()
    let storesLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Questv1 Bold", size: 16.0)
        label.text = NSLocalizedString("stores",comment:"")
        label.textColor = UIColor(named: "labelTextColor")
        return label
    }()
    lazy var storesCollectionView: StoresCollectioView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let stors = StoresCollectioView(frame:.zero, collectionViewLayout: layout)
        return stors
    }()
    let pageController: UIPageControl = {
        let pageC = UIPageControl()
        pageC.pageIndicatorTintColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        pageC.currentPageIndicatorTintColor =  UIColor(displayP3Red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
//        pageC.tintColor = .red
//        pageC.numberOfPages = 10
        return pageC
    }()
    let moreStores : UIButton = {
        let btn = UIButton(type:.system)
        btn.setTitle("more", for: .normal)
        return btn
    }()
    // MARKE:- Speachil offers PROP
    let specialOffersLab : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Questv1 Bold", size: 16.0)
        label.text = NSLocalizedString("specialOffers",comment:"")
        label.textColor = UIColor(named: "labelTextColor")
        return label
    }()
    let specialOffersBtn : UIButton = {
        let btn = UIButton(type:.system)
        btn.setTitle(NSLocalizedString("specialOffers",comment:""), for: .normal)
        return btn
    }()
    lazy var specialOffersCollectiovView: SpecialOffersCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let stors = SpecialOffersCollectionView(frame:.zero, collectionViewLayout: layout)
        return stors
    }()
//---- MARKE : BY ITEMS-
    let byItemsLab : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Questv1 Bold", size: 16.0)
        label.text = NSLocalizedString("shoppingByItems",comment:"")
        label.textColor = UIColor(named: "labelTextColor")
        return label
    }()
    let byItemsBtn : UIButton = {
        let btn = UIButton(type:.system)
        btn.setTitle(NSLocalizedString("shoppingByItems",comment:""), for: .normal)
        return btn
    }()
    lazy var byItemsCollectiovView: ByItemsCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let stors = ByItemsCollectionView(frame:.zero, collectionViewLayout: layout)
        return stors
    }()
//--- MARKE: BY CATEGORIES
    let categoriesCollectionView: CategoriesCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let stors = CategoriesCollectionView(frame:.zero, collectionViewLayout: layout)
        return stors
    }()
    let itemsExpanbleCollectionView: ItemsExpandbaleCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let stors = ItemsExpandbaleCollectionView(frame:.zero, collectionViewLayout: layout)
        return stors
    }()
    lazy var arrayViews: [UIView] = {
       let blueView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        blueView.backgroundColor = .yellow
        let greenView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        greenView.backgroundColor = .black
        let grayView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        grayView.backgroundColor = .gray
        let cyanView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        cyanView.backgroundColor = UIColor.cyan
        let blackView  = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        blackView.backgroundColor = UIColor.black
        
        return [blueView,greenView,cyanView,cyanView,blackView]
    }()
    let customAnimationPresntor = CustomAnimationPresentor()
    let customAnimationDismisser = CustomAnimationDismisser()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        UINavigationBar.appearance().barTintColor = UIColor(named: "NavColor")
        UINavigationBar.appearance().tintColor = .white
        view.backgroundColor = UIColor(named: "NavColor")
        view.addSubview(mainScrollView)
        mainScrollView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        mainScrollView.contentSize = CGSize(width: self.view.frame.width, height: 1560)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "magnifying-glass").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleProfile))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Group 63").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSearche))
//--- background ImageView
        mainScrollView.addSubview(imageView)
        mainScrollView.backgroundColor = .clear
        imageView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop:75, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        imageView.image = #imageLiteral(resourceName: "home page")
//--- ScrollView
        mainScrollView.addSubview(scrollView)
        let width = self.view.frame.width * CGFloat(arrayViews.count)
        scrollView.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 100)
        scrollView.contentSize.width =  width
        scrollView.delegate = self
//--- Page Cnotroller
        mainScrollView.addSubview(pageController)
        let x :CGFloat = (scrollView.frame.width / 2 )
        print(x,scrollView.frame.width)
//        pageController.frame = CGRect(x: x, y: 300, width: 100, height: 30)
        pageController.anchor(top: scrollView.bottomAnchor, left: nil, right: nil, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 100, height: 30)
        pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageController.numberOfPages = arrayViews.count
        
        var halfOfWidth = self.view.frame.width / 2 - 50
        for n in 0..<arrayViews.count {
            let page = arrayViews[n]
            page.frame = CGRect(x: halfOfWidth, y: 0, width:100, height: self.scrollView.frame.height)
            halfOfWidth += view.frame.width
            scrollView.addSubview(page)
        }
//MARKE:--- Stors
        mainScrollView.addSubview(storesLabel)
        storesLabel.anchor(top: pageController.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 8, paddingLeft: 8, paddingRight: 0, paddingBottom: 0, width: 100, height: 40)
        mainScrollView.addSubview(moreStores)
        moreStores.anchor(top: pageController.bottomAnchor, left: nil, right: view.trailingAnchor, bottom: nil, paddingTop: 8, paddingLeft: 0, paddingRight: 8, paddingBottom: 0, width: 100, height: 40)
//--- Stors CollectionView
        mainScrollView.addSubview(storesCollectionView)
        storesCollectionView.setupDelgate()
        storesCollectionView.anchor(top: storesLabel.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 0, height: 88)
//--- MARKE-: Speachil offers CONFIG
        mainScrollView.addSubview(specialOffersLab)
        specialOffersLab.anchor(top: storesCollectionView.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 8, paddingLeft: 8, paddingRight: 0, paddingBottom: 0, width: 100, height: 40)
        mainScrollView.addSubview(specialOffersBtn)
        specialOffersBtn.anchor(top: storesCollectionView.bottomAnchor, left: nil, right: view.trailingAnchor, bottom: nil, paddingTop: 8, paddingLeft: 0, paddingRight: 8, paddingBottom: 0, width: 100, height: 40)
        mainScrollView.addSubview(specialOffersCollectiovView)
        specialOffersCollectiovView.anchor(top: specialOffersLab.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 0, height: 80)
        
        setupShoppingByItems()
        setupCategories()
        setupItemsExpanbaleCollectionView()
    }
    func setupShoppingByItems() {
        mainScrollView.addSubview(byItemsLab)
        byItemsCollectiovView.setupDelgate()
        byItemsLab.anchor(top: specialOffersCollectiovView.bottomAnchor, left: view.leadingAnchor, right: nil, bottom: nil, paddingTop: 8, paddingLeft: 8, paddingRight: 0, paddingBottom: 0, width: 100, height: 40)
        mainScrollView.addSubview(byItemsBtn)
        byItemsBtn.anchor(top: specialOffersCollectiovView.bottomAnchor, left: nil, right: view.trailingAnchor, bottom: nil, paddingTop: 8, paddingLeft: 0, paddingRight: 8, paddingBottom: 0, width: 100, height: 40)
        mainScrollView.addSubview(byItemsCollectiovView)
        byItemsCollectiovView.anchor(top: byItemsBtn.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 0, height: 115)
        
    }
    func setupCategories() {
        mainScrollView.addSubview(categoriesCollectionView)
        categoriesCollectionView.setupDelegates()
        categoriesCollectionView.anchor(top: byItemsCollectiovView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 0, height: 45)
        categoriesCollectionView.expanble = itemsExpanbleCollectionView
        categoriesCollectionView.backgroundColor = .red
    }
    
    func setupItemsExpanbaleCollectionView() {
        mainScrollView.addSubview(itemsExpanbleCollectionView)
        itemsExpanbleCollectionView.setupDelgates()
         itemsExpanbleCollectionView.anchor(top: categoriesCollectionView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 8, paddingRight: 8, paddingBottom: 0, width: 0, height: 600)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        print(scrollView.contentOffset.x)
        pageController.currentPage = Int(page)
    }
    @objc func handleSearche() {
        print("handleSearche")
    }
    @objc func handleProfile() {
        let profile = ProfileViewController()
        profile.vi = self.view
        self.navigationController?.pushViewController(profile, animated: true)
        
    }
//    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return customAnimationPresntor
//    }
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return customAnimationDismisser
//    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customAnimationPresntor
    }
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        <#code#>
//    }
}
class PresentationController: UIPresentationController {
    override var shouldRemovePresentersView: Bool { return false }
}
