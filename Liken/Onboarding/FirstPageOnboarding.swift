//
//  FirstPageOnboarding.swift
//  Liken
//
//  Created by Qahtan on 11/19/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit

class FirstPageOnboarding: OnboardingTempletVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = #imageLiteral(resourceName: "firstPage1x")
        smallImageView.image = #imageLiteral(resourceName: "Group 101")
        textLabel.text = "أضف منتجاتك إلى سلة الشراء"
    }
}
