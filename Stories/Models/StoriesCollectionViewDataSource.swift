//
//  StoriesCollectionViewDataSource.swift
//  Stories
//
//  Created by Envoy on 6/17/17.
//  Copyright © 2017 mmn. All rights reserved.
//

import UIKit

protocol GenericCellModel {
    var title: String {get}
    var image: UIImage {get}
    func reuseId(for indexPath: IndexPath) -> String
}

protocol CollectionViewDisplayable {
    func setup(_ model: GenericCellModel)
}

class StoriesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private var items: [GenericCellModel]
    
    required init(_ items: [GenericCellModel]) {
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: model.reuseId(for: indexPath),
            for: indexPath
        )
        
        if let cell = cell as? CollectionViewDisplayable {
            cell.setup(model)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
}
