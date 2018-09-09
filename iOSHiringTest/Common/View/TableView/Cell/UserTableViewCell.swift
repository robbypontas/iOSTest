//
//  UserTableViewCell.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import UIKit
import AlamofireImage

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var imageCollectionView: UserImageCollectionView!
    @IBOutlet weak var constraintsHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }
    
    private func commonInit() {
        imageAvatar.layer.cornerRadius = 30
        imageAvatar.clipsToBounds = true
    }
    
    func setData(user: UserModel) {
        labelUsername.text = user.name
        
        imageCollectionView.setData(user: user, height: constraintsHeight)
        constraintsHeight.constant = imageCollectionView.getCollectionHeight(parentFrame: self.frame)
        
        if let imageURL = user.image {
            if(!imageURL.isEmpty) { imageAvatar.af_setImage(withURL: URL(string: imageURL)!, placeholderImage: UIImage(named: "PlaceholderUser")) }
        }
    }
}
