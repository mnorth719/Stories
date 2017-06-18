//
//  LargeStoryCollectionViewCell.swift
//  Stories
//
//  Created by Envoy on 6/17/17.
//  Copyright © 2017 mmn. All rights reserved.
//

import UIKit

class LargeStoryCollectionViewCell: UICollectionViewCell {
    enum Constants {
        static let reuseId = "LargeStoryCollectionViewCell"
        static let nibName = "LargeStoryCollectionViewCell"
    }
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 2.0
    }
}

extension LargeStoryCollectionViewCell: CollectionViewDisplayable {
    func setup(_ model: GenericCellModel) {
        self.mainImage.image = model.image
        self.mainLabel.text = model.title
    }
}
