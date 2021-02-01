//
//  ViewController.swift
//  ConstraintLayoutCode
//
//  Created by Nelson Prado on 31/01/21.
//

import UIKit

class ViewController: UIViewController {
//    var logo: Logo
    
    let descriptionTextView: UITextView = {
        let titleStyle = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        let bodyStyle = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ]
        
        let textView = UITextView()
                
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        view.addSubview(descriptionTextView)
        
        setupLayout()
        setupBottomControlls()
    }
    //MARK: - LAYOUT
    private func setupLayout() {
        
//        let logoContainer = UIView()
////        logoContainer.backgroundColor = .blue
//        logoContainer.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(logoContainer)
//
//        logoContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
//        logoContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        logoContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        logoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        logoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//
//        //apple recomanda não usar left e right e sim a leadingAnchor e a trailing anchor (ancora principal e ancora de arrasto)
////        logoContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
////        logoContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        logoContainer.addSubview(logo)
//
//        logo.widthAnchor.constraint(equalTo: logoContainer.heightAnchor, multiplier: 0.3).isActive = true
//        logo.heightAnchor.constraint(equalTo: logoContainer.heightAnchor, multiplier: 0.3).isActive = true
//        logo.centerXAnchor.constraint(equalTo: logoContainer.centerXAnchor).isActive = true
//        logo.centerYAnchor.constraint(equalTo: logoContainer.centerYAnchor).isActive = true
//
//        // DESCRIPTION CONSTRAINTS
//        descriptionTextView.topAnchor.constraint(equalTo: logoContainer.bottomAnchor).isActive = true
//        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
//        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
//        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    fileprivate func setupBottomControlls() {
        BottomControllers(parentView: self.view)
    }
}

