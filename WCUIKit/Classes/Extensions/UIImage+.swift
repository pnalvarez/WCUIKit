//
//  UIImage+.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 03/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public extension UIImage {
    
    static func getImage(from data: Data?) -> UIImage? {
        guard let data = data else {
            return nil
        }
        return UIImage(data: data)
    }
    
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    static func imageWithImage(image: UIImage, scaledToSize newSize: CGSize) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else
        { return UIImage()
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func monochromeImage() -> UIImage {
        guard let currentCGImage = cgImage else { return UIImage() }
        let currentCIImage = CIImage(cgImage: currentCGImage)

        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")

        // set a gray value for the tint color
        filter?.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: "inputColor")

        filter?.setValue(1.0, forKey: "inputIntensity")
        guard let outputImage = filter?.outputImage else { return UIImage() }

        let context = CIContext()

        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgimg)
            return processedImage
        }
        return UIImage()
    }
}
