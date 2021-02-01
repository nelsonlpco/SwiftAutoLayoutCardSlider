//
//  SwiipingController.swift
//  ConstraintLayoutCode
//
//  Created by Nelson Prado on 31/01/21.
//

import UIKit

class SwippingController: UICollectionViewController, UICollectionViewDelegateFlowLayout, PagingDelegate {
    
    
    let pages = [
        Page(image: "praia1", title: "Welcome to first beach", description: "Relex and rest in this beatifull beach"),
        Page(image: "praia2", title: "Second beach", description: "Swin and cat fishes in this paradisiac beach"),
        Page(image: "praia3", title: "Thirty beach", description: "the thirty beatifulll beach of the world"),
        Page(image: "praia4", title: "Forty beach", description: "beautifull beach in a paradisiac island"),
    ]
    
    var bottomController: BottomControllers!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomController = BottomControllers(parentView: view)
        bottomController.delegate = self
        bottomController.pageControll.numberOfPages = pages.count
        
        collectionView?.backgroundColor = .white
        collectionView.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            //corrigir scroll para pagina 0
            if self.bottomController.pageControll.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }
            else {
                let indexPath = IndexPath(item: self.bottomController.pageControll.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        } completion: { (_) in
            
        }

        
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        let index = x / view.frame.width
        bottomController.pageControll.currentPage = Int(index)
        
        print(x, view.frame.width, x / view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! PageCollectionViewCell
        
        cell.populate(page: pages[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    //MARK: - Paging controllers
    @objc func next() {
        let nextIndex = min(bottomController.pageControll.currentPage + 1, pages.count - 1)
        
        bottomController.pageControll.currentPage = nextIndex
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        print("next")
    }
    
    @objc func prev() {
        let prevIndex = max(bottomController.pageControll.currentPage - 1, 0)
        
        bottomController.pageControll.currentPage = prevIndex
        let indexPath = IndexPath(item: prevIndex, section: 0)
            
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        print("previous")
    }

}
