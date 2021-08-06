//
//  CASpringController.swift
//  SwiftAnimation
//
//  Created by 山本響 on 2021/08/06.
//

import UIKit

class CASpringController: UIViewController {
    
    fileprivate let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    fileprivate var imageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "dog"))
    fileprivate var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        view.addSubview(blurView)
        imageView.frame = view.frame
        imageView.contentMode = .scaleAspectFill
        blurView.frame = view.frame
        
        self.blurView.alpha = 0
        
        //A Boolean indicating whether sublayers are clipped to the layer’s bounds. Animatable.
        imageView.layer.masksToBounds = true
        blurView.layer.masksToBounds = true
        
        animator.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }

        setupCABasic()
        setupSlider()
        
        perform(#selector(self.animateBox), with: nil, afterDelay: 1)
    }
    
    fileprivate func setupCABasic() {
        
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.fromValue = 0
        springAnimation.toValue = 1
        springAnimation.damping = 5
        springAnimation.mass = 0
        springAnimation.duration = 10
        
        imageView.layer.add(springAnimation, forKey: "test.iosa")
        blurView.layer.add(springAnimation, forKey: "test.iosa")
    }
    
    @objc fileprivate func animateBox() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            var transform = CGAffineTransform.identity
            transform = transform.scaledBy(x: 1.1, y: 1.6)
            transform = transform.translatedBy(x: 30, y: 50)
            transform = transform.rotated(by: 45)
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
