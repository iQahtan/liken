//
//  FirstPage.swift
//  Liken
//
//  Created by Qahtan on 11/10/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class FirstPage: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        comonInit()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func comonInit() {
        Bundle.main.loadNibNamed("FirstPage", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
}
