//
//  Layouts.swift
//  RetrievePhotos
//
//  Created by Chrishon Wyllie on 3/27/17.
//  Copyright © 2017 Chrishon Wyllie. All rights reserved.
//

import Foundation
import UIKit



public let deviceScreenWidth = UIScreen.main.bounds.width
public let deviceScreenHeight = UIScreen.main.bounds.height


/*
 These objects are used for each individual UICollectionViewCell
 They will determine the size of every cell and how many will fit
 on a single "row"
 */
let sizeForTwoCells: CGFloat = (deviceScreenWidth - 2) / 2
let sizeForThreeCells: CGFloat = (deviceScreenWidth - 3) / 3
let sizeForFourCells: CGFloat = (deviceScreenWidth - 4) / 4



/*
 This is the UICollectionViewFlowLayout object used in the initial collection view.
 This is necessary for any UICollectionView. However, since I am using a
 programmatically created UICollectionViewController, this must be declared
 before presenting the controller
 Otherwise, you will receive an error saying along the lines of:
 
 Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'UICollectionView must be initialized with a non-nil layout parameter'
 */

public var photosCollectionViewLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    
    // Determines how much space in between each actual cell
    layout.minimumLineSpacing = 1
    layout.minimumInteritemSpacing = 1
    
    // Size of each item
    layout.itemSize = CGSize(width: sizeForFourCells, height: sizeForFourCells)
    
    return layout
}()
