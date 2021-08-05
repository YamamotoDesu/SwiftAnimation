# SwiftAnimation(WIP)
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
    
    
```
