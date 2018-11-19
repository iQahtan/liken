//
//  CustomImageView.swift
//  DiverApp
//
//  Created by Qahtan on 11/2/18.
//  Copyright © 2018 QahtanLab. All rights reserved.
//

import UIKit
var imageCache = [String:UIImage]()
class CustomImageView: UIImageView {
    
    var lastURLUsedToLoadImage: String?
    
    func loadImage(urlString: String) {
        
        lastURLUsedToLoadImage = urlString
        self.image = nil
        if let imageCach = imageCache[urlString] {
            self.image = imageCach
            return
        }
        guard let url = URL(string: urlString)else { return}
        URLSession.shared.dataTask(with: url) { (data, respond, error) in
            if let er = error {
                print("Field to featch post Image:",er)
                return
            }
            if url.absoluteString != self.lastURLUsedToLoadImage {
                return
            }
            guard let imageData = data else { return}
            let postImage = UIImage(data: imageData)
            imageCache[url.absoluteString] = postImage
            DispatchQueue.main.async {
                self.image = postImage
            }
            }.resume()
    }
}
class CustomImageButton: UIButton {
    let customImageView:CustomImageView = {
       let imageView = CustomImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(customImageView)
        customImageView.frame = self.frame
        customImageView.bringSubview(toFront: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
