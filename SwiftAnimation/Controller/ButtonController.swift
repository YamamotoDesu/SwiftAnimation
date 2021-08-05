//
//  ButtonController.swift
//  SwiftAnimation
//
//  Created by 山本響 on 2021/08/04.
//

import UIKit

class ButtonController: UIViewController {
    
    let basicView = UIView()
    var yAnchor: NSLayoutConstraint!
    var heightAnchor: NSLayoutConstraint!
    var widthAnchor: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = AnimationButton(title: "MCButton")
        view.addSubview(button)
        
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
}
