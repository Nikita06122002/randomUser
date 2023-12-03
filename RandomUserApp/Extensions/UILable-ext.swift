//
//  UILable-ext.swift
//  RandomUserApp
//
//  Created by macbook on 27.11.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String? = nil, font: UIFont? = nil) {
        self.init(frame: .infinite)
        if let text = text {
            self.text = text
        }
        if let font = font {
            self.font = font
        }
    }
}
