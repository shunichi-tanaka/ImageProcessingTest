//
//  Extensions.swift
//  ImageProcessingTest
//
//  Created by 田中舜一 on 2017/05/14.
//  Copyright © 2017年 田中舜一. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    func mask(image: UIImage?) -> UIImage {
        if let maskRef = image?.cgImage,
            let ref = cgImage,
            let mask = CGImage(maskWidth: maskRef.width,
                               height: maskRef.height,
                               bitsPerComponent: maskRef.bitsPerComponent,
                               bitsPerPixel: maskRef.bitsPerPixel,
                               bytesPerRow: maskRef.bytesPerRow,
                               provider: maskRef.dataProvider!,
                               decode: nil,
                               shouldInterpolate: false),
            let output = ref.masking(mask) {
            return UIImage(cgImage: output)
        }
        return self
    }
}

extension UIImageView {
    
    func resize(view: UIView) {
        
        self.frame = CGRect(x:0,y:0,width:view.frame.width,height: view.frame.height * 2)
        
    }
}


