//
//  PhotosCollectionViewController.swift
//  RetrievePhotos
//
//  Created by Chrishon Wyllie on 3/27/17.
//  Copyright © 2017 Chrishon Wyllie. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(PhotosCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.backgroundColor = .white
        
        self.collectionView!.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phassetImageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotosCell?
            
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCell
    
        let asset = phassetImageArray[indexPath.row]
        
        cell?.asset = asset
            
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let singlePhotoController = SinglePhotoViewController()
        
        let asset = phassetImageArray[indexPath.item]
        
        singlePhotoController.asset = asset
        
        navigationController?.pushViewController(singlePhotoController, animated: true)
        
    }
}
