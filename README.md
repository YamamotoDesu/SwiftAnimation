# SwiftAnimation(WIP)
### UIKit Animation
<table border="0">
    <tr>
        <tr>
            <th>Simple Animation</th>
            <th>Spring Animation</th>
            <th>Button Animation</th>
            <th>Property Animation</th>
        </tr>
        <td><img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/SimpleAnimation.gif" width="300"></td>
        <td><img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/SpringAnimation.gif" width="300"></td>
        <td><img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/ButtonAnimation.gif" width="300"></td>
        <td><img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/PropertyAnimation.gif" width="300"></td>
    </tr>
</table>

### Core Graphics
<table border="0">
    <tr>
        <tr>
            <th>CGAffineTransform Animation</th>
            <th>Core Basic Animation</th>
        </tr>
        <td><img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/CGAffine.gif" width="300"></td>
        <td><img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/CAStandardAnimation.gif" width="300"></td>
    </tr>
</table>


# Usage

## Simple Animation
<img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/SimpleAnimation.gif" width="300">  
https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Controller/SimpleController.swift  

```swift

        var spriteImages = [UIImage]()
        
        for i in 0 ..< 29 {
            spriteImages.append(UIImage(named: "tile0\(i)")!)
        }
        
        imageView.animationImages = spriteImages
        // The amount of time it takes to go through one cycle of the images
        imageView.animationDuration = 0.6
        // Specifies the number of times to repeat the animation
        imageView.animationRepeatCount = 1
        imageView.startAnimating()

```

## Spring Animation
<img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/SpringAnimation.gif" width="300">  
https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Controller/SpringController.swift  

```swift
       // Invokes a method of the receiver on the current thread using the default mode after a delay.
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
        
        // Performs a view animation using a timing curve corresponding to the motion of a physical spring.
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
            
            widthAnchor.isActive = false
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
    
    
```

## Button Animation
<img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/ButtonAnimation.gif" width="300">  
https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Controller/ButtonController.swift

```swift


        let button = AnimationButton(title: "MCButton")
        view.addSubview(button)

        UIView.animate(withDuration: 0.6, delay: 1, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.5, options: .curveLinear) {
            self.view.layoutIfNeeded()
        }

```

https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/View/AnimationButton.swift  

```swift

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
            // resetting any changes that have been applied by modifying its transform property
            self.transform = .identity
        }
    }

```


## Property Animation
<img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/PropertyAnimation.gif" width="300">  
https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Controller/PropertyController.swift 

```swift
        // A class that animates changes to views and allows the dynamic modification of those animations.
        let animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil) 
        self.blurView.alpha = 0
        
        animator.addAnimations {
            self.blurView.alpha = 1
            // An affine transformation matrix for use in drawing 2D graphics.
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }

        slider.addTarget(self, action: #selector(handleSliderChanged(slider:)), for: .allEvents)
    }
       
    @objc fileprivate func handleSliderChanged(slider: UISlider) {
        print(slider.value)
        // The completion percentage of the animation
        animator.fractionComplete = CGFloat(slider.value)
    }
```

## CGAffineTransform Animation
<table border="0">
    <tr>
        <tr>
            <th>CGAffineTransform Animation</th>
            <th>scaledBy(x: 1.1, y: 1.6)</th>
            <th>transform.translatedBy(x: 100, y: 100)</th>
            <th>transform.rotated(by: 45)</th>
        </tr>
        <td><img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/CGAffine.gif" height="400" width="200"></td>
        <td><img src="https://user-images.githubusercontent.com/47273077/128437486-73e6e88e-e708-4813-9e87-c3aae93a88c9.png" height="400" width="200"></td>
        <td><img src="https://user-images.githubusercontent.com/47273077/128438212-38455869-d00d-4947-ba13-8b6aedde09f3.png" height="400" width="200"></td>
        <td><img src="https://user-images.githubusercontent.com/47273077/128437840-1f18c1e9-f15f-49b7-bc9c-3f3ffdb9d0d9.png" height="400" width="200"></td>
    </tr>

</table>
https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Controller/CGAffineTransformController.swift

```swift

        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) {
            var transform = CGAffineTransform.identity
            transform = transform.scaledBy(x: 1.1, y: 1.6)
            transform = transform.translatedBy(x: 30, y: 50)
            transform = transform.rotated(by: 45)
            
            self.box.transform = transform
        }

```

## Core Basic Animation
<table border="0">
    <tr>
        <tr>
            <th>CGAffineTransform Animation</th>
            <th>scaledBy(x: 1.1, y: 1.6)</th>
            <th>transform.translatedBy(x: 100, y: 100)</th>
            <th>transform.rotated(by: 45)</th>
        </tr>
        <td><img src="https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Git/CAStandardAnimation.gif" height="400" width="200"></td>
        <td><img src="https://user-images.githubusercontent.com/47273077/128437486-73e6e88e-e708-4813-9e87-c3aae93a88c9.png" height="400" width="200"></td>
        <td><img src="https://user-images.githubusercontent.com/47273077/128438212-38455869-d00d-4947-ba13-8b6aedde09f3.png" height="400" width="200"></td>
        <td><img src="https://user-images.githubusercontent.com/47273077/128437840-1f18c1e9-f15f-49b7-bc9c-3f3ffdb9d0d9.png" height="400" width="200"></td>
    </tr>

</table>
https://github.com/YamamotoDesu/SwiftAnimation/blob/main/SwiftAnimation/Controller/CABasicAnimationController.swift

```swift

        let basic0 = CABasicAnimation(keyPath: "transform.scale")
        // Defines the value the receiver uses to end interpolation.
        basic0.toValue = 0.5
        basic0.duration = 2
        
        // The receiver remains visible in its final state when the animation is completed.
        basic0.fillMode = CAMediaTimingFillMode.forwards
        // Determines if the animation is removed from the target layer’s animations upon completion.
        basic0.isRemovedOnCompletion = false
        
        imageView.layer.add(basic0, forKey: "test.io")
        
```



