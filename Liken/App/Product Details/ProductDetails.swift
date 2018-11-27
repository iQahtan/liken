//
//  ProductDetails.swift
//  Liken
//
//  Created by Qahtan on 11/25/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ProductDetails: TempletViewController {
    
    var colors :[UIColor] = [.black,.yellow,.black,.yellow]
    let cellId = "cellId"
    
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    let stackView: UIStackView = {
        let vi = UIStackView()
        vi.axis = .horizontal
        vi.distribution = .fillEqually
        return vi
    }()
    let addToCart: UIButton = {
        let btn = UIButton(type: .system)
        let attrubitedString = NSMutableAttributedString(string: "أضف إلى السلة", attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 19),NSAttributedStringKey.foregroundColor:UIColor.white])
        btn.backgroundColor = UIColor(named: "green")
        btn.setAttributedTitle(attrubitedString, for: .normal)
        return btn
    }()
    let productImages: UICollectionView = {
        let coll = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        coll.backgroundColor = .green
        coll.tag = 0
        return coll
    }()
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 10
        return pc
    }()
    let prodictPriceLabel: UILabel = {
        let lab = UILabel()
        let attributedString = NSMutableAttributedString(string: "20 SR ", attributes: [NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 231, green: 96, blue: 72),NSAttributedStringKey.font: UIFont(name: "Tajawal-Medium", size: 31) ])

        attributedString.append(NSAttributedString(string: " / KG", attributes: [NSAttributedStringKey.foregroundColor : UIColor.rgb(red: 88, green: 88, blue: 88),NSAttributedStringKey.font:UIFont(name: "Tajawal-Medium", size: 14)]))
        lab.attributedText = attributedString
        lab.textAlignment = .center
        return lab
    }()
    let productInfoLabel: UILabel = {
        let lab = UILabel()
        lab.text = "نص يمكن إستبداله لإستخدامه كوصف للمنتج، نص كوصف للمنتج، نص كوصف للمنتج، نص كوصف للمنتج، نص"
        lab.numberOfLines = 0
        lab.font = UIFont(name: "Tajawal-Medium", size: 14)
        lab.textColor = UIColor.rgb(red: 88, green: 88, blue: 88)
        return lab
    }()
    lazy var productTextChocces: ProdictChoesessCollectionView = {
        let coll = ProdictChoesessCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        coll.backgroundColor = .blue
        coll.delegate = self
        coll.tag = 1
        return coll
    }()
    lazy var itemsCollectionView: UICollectionView = {
         let coll = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        coll.backgroundColor = .green
        coll.delegate = self
        coll.dataSource = self
        coll.tag = 2
        return coll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    func setupViews(){
        itemsCollectionView.register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(scrollView)
        scrollView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        
        view.addSubview(stackView)
        stackView.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 69)
        
        scrollView.addSubview(productImages)
        productImages.anchor(top: scrollView.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 250)
        
        scrollView.addSubview(pageControl)
        pageControl.anchor(top: productImages.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 4, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 21)
        
        scrollView.addSubview(prodictPriceLabel)
        prodictPriceLabel.anchor(top: pageControl.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 43)
        
        scrollView.addSubview(productInfoLabel)
        productInfoLabel.anchor(top: prodictPriceLabel.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 10, paddingLeft: 30, paddingRight: 30, paddingBottom: 0, width: 0, height: 40)
        
        scrollView.addSubview(productTextChocces)
        productTextChocces.anchor(top: productInfoLabel.bottomAnchor, left: nil , right: nil, bottom: nil, paddingTop: 45, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 280, height: 40)
        productTextChocces.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(itemsCollectionView)
        itemsCollectionView.anchor(top: productTextChocces.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 20, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 200)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "إسم المنتج"
    }
}
extension ProductDetails: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
}
extension ProductDetails:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1 {
            print("GGGG")
            if indexPath.row == 0 {
                self.colors = [.black,.yellow,.black,.yellow]
                itemsCollectionView.reloadData()
            }else{
                self.colors = [.brown,.blue,.brown,.blue,.brown,.blue,]
                itemsCollectionView.reloadData()
            }
        }
    }
}
extension ProductDetails: UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 130, height: 35)
        }else if collectionView.tag == 2  {
            return CGSize(width: 98, height: 98)
        }else{
            return CGSize(width: 10, height: 10)
        }
    }
    
}
