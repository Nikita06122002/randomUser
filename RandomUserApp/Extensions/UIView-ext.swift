//
//  UIView-ext.swift
//  RandomUserApp
//
//  Created by macbook on 27.11.2023.
//

import UIKit

extension UIView {
    func enableTamic() {
        
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
