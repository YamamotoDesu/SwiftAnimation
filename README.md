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
