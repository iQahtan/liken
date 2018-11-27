//
//  OnboardingViewController.swift
//  Liken
//
//  Created by Qahtan on 11/19/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    lazy var pages: [UIViewController] = {
        let firstPage = FirstPageOnboarding()
        let secondPage = SecondPageOnboarding()
        let thirdPage = ThirdPageOnboarding()
        return [ firstPage,secondPage,thirdPage]
    }()
    let pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.tintColor = .blue
        pc.currentPageIndicatorTintColor = UIColor.rgb(red: 12, green: 120, blue: 255)
        pc.pageIndicatorTintColor = .white
        return pc
    }()
//    let skipButton: UIButton = {
//        let btn = UIButton(type: .system)
//        let attributedString = NSMutableAttributedString(string: NSLocalizedString("skip", comment: ""), attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Bold", size: 18),NSAttributedStringKey.foregroundColor: UIColor.white])
//        btn.setAttributedTitle(attributedString, for: .normal)
//        return btn
//    }()
    let skipButton: UIButton = {
        let btn = UIButton(type: .system)
        let attributedString = NSMutableAttributedString(string: NSLocalizedString("skip", comment: ""), attributes: [NSAttributedStringKey.font : UIFont(name: "Tajawal-Bold", size: 18),NSAttributedStringKey.foregroundColor: UIColor.white])
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.addTarget(self, action: #selector(handleDismissOnboarding), for: .touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pageController)
        view.addSubview(skipButton)
        skipButton.anchor(top: nil, left: view.leadingAnchor, right: nil, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 20, paddingRight: 0, paddingBottom: 40, width: 40, height: 20)
        pageController.anchor(top: nil, left: nil, right: nil, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 40, width: 120, height: 25)
        pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        pageController.numberOfPages = pages.count
        pageController.currentPage = 0
        self.dataSource = self
        self.delegate = self
        if let firstVC = pages.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        view.bringSubview(toFront: pageController)
//        view.bringSubviewToFront(pageController)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func handleDismissOnboarding() {
        print("handleDismissOnboarding")

        guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarViewController else { return }
        dismiss(animated: true, completion: nil)
    }
}
extension OnboardingPageViewController: UIPageViewControllerDataSource,UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = pages.index(of: viewController)!
        let previousIndex = currentIndex - 1
        pageController.currentPage = currentIndex
        
        return (previousIndex == -1) ? nil : pages[previousIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        
        let currentIndex = pages.index(of: viewController)!
        let nextIndex = currentIndex + 1
        pageController.currentPage = currentIndex
        return (nextIndex == pages.count) ? nil : pages[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
                let index = pages.index(of: currentViewController) {
                pageController.currentPage = index
            }
        }
    }
}
