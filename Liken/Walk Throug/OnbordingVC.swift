//
//  OnbordingVC.swift
//  Liken
//
//  Created by Qahtan on 11/10/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class OnbordingVC: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    lazy var  viewsArry : [UIView] = {
        let firstView = FirstPage()
        let secondView = SecondPage()
        return [firstView,secondView]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(scrollView.contentSize)
        print(scrollView,viewsArry.count)
        pageControl.numberOfPages = viewsArry.count
        scrollView.delegate = self
        scrollView.contentSize.width = view.frame.width * CGFloat(viewsArry.count)
//        scrollView.showsHorizontalScrollIndicator = true
        scrollView.frame.size = self.view.frame.size
        
        for n in 0..<viewsArry.count {
            
            let page = viewsArry[n]
            let xPosition = self.view.frame.width * CGFloat(n)
            page.frame = CGRect(x: xPosition, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
            scrollView.addSubview(page)
        }
    }
    
    @IBAction func dismissOnbording(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
//        let userDefault = UserDefaults.standard
//        userDefault.set(true, forKey: "onBoardingComplete")
//        userDefault.synchronize()
        
        //present the new view controller
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "app")
        present(vc, animated: true, completion: nil)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(page)
        
    }

    func showApp () {

        //Change flag
        let userDefault = UserDefaults.standard
        userDefault.set(true, forKey: "onBoardingComplete")
        userDefault.synchronize()

        //present the new view controller
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "app")
        present(vc, animated: true, completion: nil)
    }
}
