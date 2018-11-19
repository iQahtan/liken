//
//  MyCartViewController.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class MyCartViewController:TempletViewController {
    let itemsCount: UILabel = {
        let lab = UILabel()
        return lab
    }()
    let seprator: UIView = {
        let vi = UIView()
        vi.backgroundColor = UIColor.rgb(red: 112, green: 112, blue: 112)
        return vi
    }()
    let table: ItemsTableView = {
        let table = ItemsTableView()
        
        return table
    }()
    let pricView: PriceView = {
        let p = PriceView()
        return p
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("myCart", comment: "")
        // fetch items from database
        setupViews()
        view.addSubview(pricView)
        pricView.anchor(top: nil, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 110)
        setupTableView()
        
    }
    func setupTableView() {
        view.addSubview(table)
        table.anchor(top: seprator.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: pricView.topAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    func setupViews() {
        let attrubitedString = NSMutableAttributedString(string: NSLocalizedString("youHave", comment: ""), attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Medium", size: 12),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78)])
        attrubitedString.append(NSMutableAttributedString(string: " \(5) ", attributes: [NSAttributedStringKey.font :UIFont(name: "Tajawal-Medium", size: 15),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78) ]))
        attrubitedString.append(NSMutableAttributedString(string: NSLocalizedString("itemsInYourCart", comment: ""), attributes: [NSAttributedStringKey.font :UIFont(name: "Tajawal-Medium", size: 12),NSAttributedStringKey.foregroundColor:UIColor.rgb(red: 78, green: 78, blue: 78) ]))
        
        itemsCount.attributedText = attrubitedString
        view.addSubview(itemsCount)
        itemsCount.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 16, paddingRight: 16, paddingBottom: 0, width: 0, height: 25)
        
        view.addSubview(seprator)
        seprator.anchor(top: itemsCount.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 1)
    }
}
