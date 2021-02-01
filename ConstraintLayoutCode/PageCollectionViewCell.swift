//
//  PageCollectionViewCell.swift
//  ConstraintLayoutCode
//
//  Created by Nelson Prado on 31/01/21.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    let titleFont = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
    let descriptionFont = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
        NSAttributedString.Key.foregroundColor: UIColor.gray
    ]
    
    let textDescription: UITextView = {
        let description = UITextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.isEditable = false
        description.isScrollEnabled = false
        
        return description
    }()
    
    var logo: Logo?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        
        let logoContainer = UIView()
        logoContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(logoContainer)
        
        
        guard let image = UIImage(named: "praia1") else { return  }
        logo = Logo(logoContainer, image: image)
        
        contentView.addSubview(textDescription)
        
        NSLayoutConstraint.activate([
            logoContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            logoContainer.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            textDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textDescription.topAnchor.constraint(equalTo: logoContainer.bottomAnchor, constant: 12),
        ])
    }
    
    func populate(page: Page) {
        guard let image = UIImage(named: page.image) else { return }
        let texts = NSMutableAttributedString(string: page.title, attributes: titleFont)
        texts.append(NSMutableAttributedString(string: "\n\n\n\(page.description)", attributes: descriptionFont))
        
        logo?.imageView.image = image
        textDescription.attributedText = texts
        textDescription.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
