//
//  Logo.swift
//  ConstraintLayoutCode
//
//  Created by Nelson Prado on 31/01/21.
//

import UIKit

class Logo: NSObject {
    let parent: UIView
    let imageView: UIImageView
    
    init(_ parent: UIView, image: UIImage ) {
        self.parent = parent
        
        imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 50
        
        parent.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.centerYAnchor.constraint(equalTo: parent.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: parent.centerXAnchor)
        ])
    }
}
