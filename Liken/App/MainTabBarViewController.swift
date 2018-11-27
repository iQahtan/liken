//
//  MainTabBarViewController.swift
//  Liken
//
//  Created by Qahtan on 11/10/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController,UITabBarControllerDelegate{
    var userSingin = true
    var firstTime = true
    lazy var titles: [String] = {
        let home = NSLocalizedString("home", comment: "")
        let cart = NSLocalizedString("myCart", comment: "")
        let stors = NSLocalizedString("stores", comment: "")
        let ddd = NSLocalizedString("ddd", comment: "")
        return [home,ddd,"",stors,cart]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupViewControllers()
        if firstTime == false {
            DispatchQueue.main.async {
                let onboarding  = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
                let nav = UINavigationController(rootViewController: onboarding)
                nav.setNavigationBarHidden(true, animated: true)
                self.present(nav, animated: true, completion: nil)
            }
        }
        if userSingin == false {
            DispatchQueue.main.async {
                let signupVC  = SignupViewController()
                let nav = UINavigationController(rootViewController: signupVC)
                nav.setNavigationBarHidden(true, animated: true)
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    func setupViewControllers() {
        let homeVC = HomeVC()
         let homeNavController = templetNavController(selected: #imageLiteral(resourceName: "044-real-estate"), unselected: #imageLiteral(resourceName: "044-real-estate"),rootViewController: homeVC)
        let categories = ByItemsViewController()
        let categoriesNav = templetNavController(selected: #imageLiteral(resourceName: "053-menu"), unselected: #imageLiteral(resourceName: "053-menu"),rootViewController: categories)
        let camperingVC = Comparing()
        let comper = templetNavController(selected: #imageLiteral(resourceName: "Compering"), unselected: #imageLiteral(resourceName: "Compering"),rootViewController: camperingVC)
        let stores = Stores()
        let stors = templetNavController(selected: #imageLiteral(resourceName: "007-shop-1"), unselected: #imageLiteral(resourceName: "007-shop-1"),rootViewController: stores)
        let myCartViewController = MyCartViewController()
        let cart = templetNavController(selected:#imageLiteral(resourceName: "cart"), unselected: #imageLiteral(resourceName: "cart"),rootViewController: myCartViewController)
//        tabBar.tintColor = .black
        viewControllers = [homeNavController,
                            categoriesNav,
                            comper,
                            stors,
                            cart]
        guard let items = tabBar.items else { return }
        for (index,item) in  items.enumerated() {
            print(index)
            if index == 2 {
                item.imageInsets = UIEdgeInsets(top: -5 , left:0, bottom: 10, right: 0 )
            }else {
                item.badgeColor = UIColor(named: "green")
                
                item.imageInsets = UIEdgeInsets(top: 0 , left:0, bottom: 0, right: 0 )
                item.title = titles[index]
                item.setTitleTextAttributes([NSAttributedStringKey.font :UIFont(name: "Questv1-Bold", size: 11),NSAttributedStringKey.foregroundColor:UIColor(named: "green") ], for: .selected)
            }
            
        }
    }
    fileprivate func templetNavController(selected: UIImage,unselected: UIImage,rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let tempController = rootViewController
        let tempNavController = UINavigationController(rootViewController: tempController)
        tempNavController.tabBarItem.image = unselected
        tempNavController.tabBarItem.selectedImage = selected
        UINavigationBar.appearance().barTintColor = UIColor(named: "NavColor")
//        UINavigationBar.appearance().tintColor = .white
        
        tempNavController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        tempNavController.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        tempNavController.navigationBar.backgroundColor = UIColor(named: "NavColor")
        return tempNavController
    }
}
