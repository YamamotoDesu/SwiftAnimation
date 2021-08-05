//
//  SimpleController.swift
//  SwiftAnimation
//
//  Created by 山本響 on 2021/08/03.
//

import UIKit

//UIKit Animation
class SimpleController: UIViewController {
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "tile00")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        imageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        for i in 0 ..< 29 {
            spriteImages.append(UIImage(named: "tile0\(i)")!)
        }

    }
    
    var spriteImages = [UIImage]()
    
    @objc func animate() {
        print("trying to animate image")
        imageView.animationImages = spriteImages
        imageView.animationDuration = 0.6
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }


}

