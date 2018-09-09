//
//  UserImageCollectionView.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import UIKit
import AlamofireImage

class UserImageCollectionView: UICollectionView {
    var images: [String] = []
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    
    private var heightCell: CGFloat = 0;
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "UserImageCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "UserImageCollectionViewCell")
    }
    
    private func calculateCellSize(parentFrame: CGRect) -> CGFloat {
        let paddingSpace = sectionInsets.top * (itemsPerRow+2)
        let availableWidth = parentFrame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        heightCell = widthPerItem
        
        return heightCell
    }
    
    func getCollectionHeight(parentFrame: CGRect) -> CGFloat {
        let count = images.count > 0 ? (images.count / 2) + ((images.count % 2 == 0) ? 0 : 2 ) : 1
        
        return CGFloat(count) * (calculateCellSize(parentFrame: parentFrame) + (sectionInsets.bottom * 2) )
        
    }
    
    func setData(user: UserModel, height: NSLayoutConstraint) {
        if let images = user.items {
            self.images = images
        } else {
            self.images = []
        }

        reloadData()
    }
}

extension UserImageCollectionView: UICollectionViewDelegate {
    
}

extension UserImageCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserImageCollectionViewCell",
                                                      for: indexPath) as! UserImageCollectionViewCell
        
        cell.setData(url: images[indexPath.row])
        
        return cell
    }
}

extension UserImageCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let originCellSize = calculateCellSize(parentFrame: self.frame)
        let widthPerItem = images.count % 2 == 1 && indexPath.row == 0 ? self.frame.size.width : originCellSize + (sectionInsets.top * 1.5)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.top
    }
}
