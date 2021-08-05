//
//  SpringController.swift
//  SwiftAnimation
//
//  Created by 山本響 on 2021/08/03.
//

import UIKit

//UIKit Spring Animation
class SpringController: UIViewController {
    
    let basicView = UIView()
    var yAnchor: NSLayoutConstraint!
    var heightAnchor: NSLayoutConstraint!
    var widthAnchor: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicView.backgroundColor = .blue
        basicView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(basicView)
        
        yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        yAnchor.isActive = true
        
        basicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        heightAnchor = basicView.heightAnchor.constraint(equalToConstant: 200)
        heightAnchor.isActive = true
        
        widthAnchor = basicView.widthAnchor.constraint(equalToConstant: 200)
        widthAnchor.isActive = true
        
        perform(#selector(animateBox), with: nil, afterDelay: 2)
        
        basicView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOnTap)))
    }
    
    @objc fileprivate func animateBox() {
        
        yAnchor.isActive = false
        yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        yAnchor.isActive = true
        
        widthAnchor.isActive = false
        widthAnchor = basicView.widthAnchor.constraint(equalToConstant: 300)
        widthAnchor.isActive = true
        
        heightAnchor.isActive = false
        heightAnchor = basicView.heightAnchor.constraint(equalToConstant: view.frame.height - 50)
        heightAnchor.isActive = true
        
        UIView.animate(withDuration: 0.6, delay: 1, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveLinear) {
            self.view.layoutIfNeeded()
        }
    }
    
    var tapped:Bool = false
    
    @objc func animateOnTap() {
        
        if tapped {
            widthAnchor.isActive = false
            widthAnchor = basicView.widthAnchor.constraint(equalToConstant: view.frame.width/2)
            widthAnchor.isActive = true
        } else {
            yAnchor.isActive = false
            yAnchor = basicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
            yAnchor.isActive = true
            
            //widthAnchor.isActive = false
            widthAnchor = basicView.widthAnchor.constraint(equalToConstant: view.frame.width - 20)
            widthAnchor.isActive = true
            
            heightAnchor.isActive = false
            heightAnchor = basicView.heightAnchor.constraint(equalToConstant: 200)
            heightAnchor.isActive = true
            
            UIView.animate(withDuration: 0.6, delay: 1, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveLinear) {
                self.view.layoutIfNeeded()
            }
        }
        
        self.tapped = !tapped
    }
}

