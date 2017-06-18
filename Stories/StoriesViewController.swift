//
//  ViewController.swift
//  Stories
//
//  Created by Envoy on 6/17/17.
//  Copyright © 2017 mmn. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController {
    enum Constants {
        static let insetWidth: CGFloat = 16.0
    }
    
    func populateItems() {
        DispatchQueue.main.async {
            var stories = [Story]()
            for _ in 0..<10 {
                let story = Story(mainTitle: "Cancun Spring Break", images: [UIImage(named: "beachScene")!], id: nil)
                stories.append(story)
            }
        
            self.dataSource = StoriesCollectionViewDataSource(stories)
            self.collectionView.dataSource = self.dataSource!
            self.collectionView.delegate = self
            self.collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: StoriesCollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.register(
            UINib(nibName: LargeStoryCollectionViewCell.Constants.nibName, bundle: nil),
            forCellWithReuseIdentifier: LargeStoryCollectionViewCell.Constants.reuseId
        )
        
        populateItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension StoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width - (Constants.insetWidth)
        let height = width * 0.75
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}


