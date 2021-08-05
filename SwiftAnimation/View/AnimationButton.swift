//
//  UIKitMCAnimationButton.swift
//  SwiftAnimation
//
//  Created by 山本響 on 2021/08/04.
//

import UIKit

class AnimationButton: UIButton {
    
    fileprivate var wAnchor: NSLayoutConstraint?
    fileprivate var hAnchor: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        phaseTwo(title: "Button")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        wAnchor = widthAnchor.constraint(equalToConstant: 150)
        wAnchor?.isActive = true
        
        hAnchor = heightAnchor.constraint(equalToConstant: 54)
        guard let hAnchor = hAnchor else { return }
        hAnchor.isActive = true
        
        phaseTwo(title: title)
    }
    
    fileprivate func phaseTwo(title: String) {
        layer.cornerRadius = 12
        backgroundColor = .blue
        setTitle("Button", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        //addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateButton)))
        addTarget(self, action: #selector(down), for: .touchDown)
        addTarget(self, action: #selector(up), for: .touchUpInside)
    }
    
    @objc fileprivate func down() {
        
        wAnchor?.isActive = false
        hAnchor?.isActive = false
        wAnchor?.constant = 100
        hAnchor?.constant = 100
        wAnchor?.isActive = true
        hAnchor?.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.superview?.layoutIfNeeded()
            //self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }

    }
    
    @objc fileprivate func up() {
        
        wAnchor?.isActive = false
        hAnchor?.isActive = false
        wAnchor?.constant = 150
        hAnchor?.constant = 54
        wAnchor?.isActive = true
        hAnchor?.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            self.superview?.layoutIfNeeded()
            //self.transform = .identity
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
