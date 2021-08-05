//
//  PropertyController.swift
//  SwiftAnimation
//
//  Created by 山本響 on 2021/08/05.
//

import UIKit

class PropertyController: UIViewController {
    
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
        
        animator.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }

        setupSlider()
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
