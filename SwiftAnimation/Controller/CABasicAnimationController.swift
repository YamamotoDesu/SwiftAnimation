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
        let basic0 = CABasicAnimation(keyPath: "transform.scale")
        // Defines the value the receiver uses to end interpolation.
        basic0.toValue = 0.5
        basic0.duration = 2
        
        // The receiver remains visible in its final state when the animation is completed.
        basic0.fillMode = CAMediaTimingFillMode.forwards
        // Determines if the animation is removed from the target layer’s animations upon completion.
        basic0.isRemovedOnCompletion = false
        
        imageView.layer.add(basic0, forKey: "test.io")
        blurView.layer.add(basic0, forKey: "test.io")
        
        let basic1 = CABasicAnimation(keyPath: "conrerRadius")
        // Defines the value the receiver uses to end interpolation.
        basic1.toValue = 50
        basic1.duration = 2
        
        // The receiver remains visible in its final state when the animation is completed.
        basic1.fillMode = CAMediaTimingFillMode.forwards
        // Determines if the animation is removed from the target layer’s animations upon completion.
        basic1.isRemovedOnCompletion = false
        
        imageView.layer.add(basic1, forKey: "test.io/1")
        blurView.layer.add(basic1, forKey: "test.io/1")
        
        let basic2 = CABasicAnimation(keyPath: "opacity")
        // Defines the value the receiver uses to end interpolation.
        basic2.toValue = 0
        basic2.duration = 2
        
        // The receiver remains visible in its final state when the animation is completed.
        basic2.fillMode = CAMediaTimingFillMode.forwards
        // Determines if the animation is removed from the target layer’s animations upon completion.
        basic2.isRemovedOnCompletion = false
        blurView.layer.add(basic2, forKey: "test.io/2")
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
