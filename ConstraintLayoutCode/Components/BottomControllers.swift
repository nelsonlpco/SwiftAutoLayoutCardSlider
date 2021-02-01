//
//  BottomControllers.swift
//  ConstraintLayoutCode
//
//  Created by Nelson Prado on 31/01/21.
//

import UIKit

extension UIColor {
    static var mainPink =  UIColor(red: 232 / 255, green: 68 / 255, blue: 133/255, alpha: 1)
}

@objc protocol PagingDelegate {
    @objc func next()
    @objc func prev()
}

class BottomControllers: NSObject {
    let parentView: UIView
    let container: UIStackView
    let prevButton: UIButton
    let nextButton: UIButton
    let pageControll: UIPageControl
    let pinkColor = UIColor(red: 232 / 255, green: 68 / 255, blue: 133/255, alpha: 1)
    
    private var _delegate: PagingDelegate?
    var delegate: PagingDelegate? {
        set (value){
            _delegate = value
            startDelegate()
        }
        get {
            return _delegate
        }
    }
    
    init(parentView: UIView) {
        self.parentView = parentView
        container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.distribution = .fillProportionally
        container.axis = .horizontal
        
        nextButton = UIButton()
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.setTitleColor(.mainPink, for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
//        nextButton.backgroundColor = .blue
        
        prevButton = UIButton()
        prevButton.setTitle("PREV", for: .normal)
        prevButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        prevButton.setTitleColor(UIColor.gray, for: .normal)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
//        prevButton.backgroundColor = .blue
        
        pageControll = UIPageControl()
        pageControll.currentPage = 0
        pageControll.numberOfPages = 0
        pageControll.currentPageIndicatorTintColor = .mainPink
        pageControll.pageIndicatorTintColor = .gray
        

        container.addArrangedSubview(prevButton)
        container.addArrangedSubview(pageControll)
        container.addArrangedSubview(nextButton)
        
        parentView.addSubview(container)
        
        NSLayoutConstraint.activate(
            [
                container.heightAnchor.constraint(equalToConstant: 50),
                container.bottomAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.bottomAnchor),
                container.leadingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.leadingAnchor),
                container.trailingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.trailingAnchor),
            ]
        )
    }
    
    private func startDelegate() {
        print("setting delegates")
        nextButton.addTarget(delegate, action: #selector(delegate?.next), for: .touchUpInside)
        prevButton.addTarget(delegate, action: #selector(delegate?.prev), for: .touchUpInside)
    }
}
