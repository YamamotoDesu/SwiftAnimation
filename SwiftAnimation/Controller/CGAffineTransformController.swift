//
//  CGAffineTransformController.swift
//  SwiftAnimation
//
//  Created by 山本響 on 2021/08/06.
//

import UIKit

class CGAffineTransformController: UIViewController {
    
    fileprivate let box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(box)
        box.backgroundColor = .red
        box.translatesAutoresizingMaskIntoConstraints = false
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        box.widthAnchor.constraint(equalToConstant: 150).isActive = true
        box.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        perform(#selector(self.animateBox), with: nil, afterDelay: 1)
    }
    
    @objc fileprivate func animateBox() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            var transform = CGAffineTransform.identity
            transform = transform.scaledBy(x: 1.1, y: 1.6)
            transform = transform.translatedBy(x: 30, y: 50)
            transform = transform.rotated(by: 45)
            
            self.box.transform = transform
        }

    }

}
