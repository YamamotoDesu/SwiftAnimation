//
//  CABasicAnimationController.swift
//  SwiftAnimation
//
//  Created by 山本響 on 2021/08/06.
//

import UIKit

class CABasicAnimationController: UIViewController {
    
    fileprivate let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    fileprivate var imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "dog"))
    fileprivate var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
    
    fileprivate let box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(blurView)
        imageView.frame = view.frame
        imageView.contentMode = .scaleAspectFill
        blurView.frame = view.frame
        
        self.blurView.alpha = 0
        
        animator.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }

        setupSlider()
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
    
    fileprivate func setupSlider() {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)

        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
        
        slider.addTarget(self, action: #selector(handleSliderChanged(slider:)), for: .allEvents)
    }
    
    @objc fileprivate func handleSliderChanged(slider: UISlider) {
        print(slider.value)
        animator.fractionComplete = CGFloat(slider.value)
    }

}
