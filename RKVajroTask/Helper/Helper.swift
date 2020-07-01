//
//  Helper.swift
//  RKVajroTask
//
//  Created by ramakrishna utti on 30/06/20.
//  Copyright © 2020 ramakrishnautti. All rights reserved.
//

import Foundation
import UIKit
class ScaledHeightImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        if let myImage = self.image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = self.frame.size.width
            let ratio = myViewWidth/myImageWidth
            let scaledHeight = myImageHeight * ratio
            return CGSize(width: myViewWidth, height: scaledHeight)
        }
        return CGSize(width: -1.0, height: -1.0)
    }
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
    }
    override func layoutSubviews() {
           super.layoutSubviews()
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
}
