//
//  StoryCellModel.swift
//  Stories
//
//  Created by Envoy on 6/17/17.
//  Copyright © 2017 mmn. All rights reserved.
//

import UIKit


struct Story {
    var mainTitle: String?
    var images: [UIImage]?
    var id: String?
}

extension Story: GenericCellModel {
    var title: String {
        return mainTitle ?? ""
    }
    
    var image: UIImage {
        return images?.first ?? UIImage()
    }
    
    func reuseId(for indexPath: IndexPath) -> String {
        return LargeStoryCollectionViewCell.Constants.reuseId
    }
}
