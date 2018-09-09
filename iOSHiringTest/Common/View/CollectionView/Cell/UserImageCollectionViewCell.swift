//
//  UserImageCollectionViewCell.swift
//  iOSHiringTest
//
//  Created by Robby Pontas on 9/9/18.
//  Copyright © 2018 wonderlabs. All rights reserved.
//

import UIKit

class UserImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.contentMode = .scaleAspectFill
    }
    
    func setData(url: String) {
        if(!url.isEmpty) { image.af_setImage(withURL: URL(string: url)!, placeholderImage: UIImage(named: "PlaceholderImage")) }
    }
    
}
