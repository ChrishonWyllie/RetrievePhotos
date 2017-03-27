//
//  PhotosCell.swift
//  RetrievePhotos
//
//  Created by Chrishon Wyllie on 3/27/17.
//  Copyright © 2017 Chrishon Wyllie. All rights reserved.
//

import UIKit
import Photos

class PhotosCell: UICollectionViewCell {
    
    var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        return label
    }()
    
    let imgManager = PHImageManager.default()
    
    var reqOptions: PHImageRequestOptions? {
        didSet {
            if let _reqOptions = reqOptions {
                _reqOptions.isSynchronous = true
            }
        }
    }
    
    func configureVideoDurationString(duration: Double) -> String {
        var formattedDurationString = String()
        // less than one minute
        if duration < 60.0 {
            formattedDurationString = "0:\(String(Int(duration)))"
        } else {
            
            //print("total Duration: \(duration)")
            
            var numberOfMinutes: Int! = 0
            var remainder: Int! = Int(duration)
            
            while remainder > 60 {
                remainder = remainder - 60
                numberOfMinutes = numberOfMinutes + 1
            }
            formattedDurationString = "\(String(numberOfMinutes)):\(String(remainder))"
            
        }
        return formattedDurationString
    }
    
    var asset: PHAsset? {
        didSet {
            if let _asset = asset {
                
                durationLabel.text = configureVideoDurationString(duration: _asset.duration.rounded())

                // This will work even if it is an image
                if _asset.duration != 0.0 {
                    
                    durationLabel.isHidden = false
                    
                } else {
                    
                    durationLabel.isHidden = true
                
                }
                
                let width = 300 //self.frame.size.width
                let height = 300 //self.frame.size.height
                
                let thumbnailSize: CGSize = CGSize(width: width, height: height)
                imgManager.requestImage(for: _asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: reqOptions, resultHandler: { (image, info) in
                    self.photo.image = image
                })
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photo)
        addSubview(durationLabel)
        
        photo.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photo.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        photo.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        photo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
        durationLabel.trailingAnchor.constraint(equalTo: photo.trailingAnchor, constant: -1).isActive = true
        durationLabel.bottomAnchor.constraint(equalTo: photo.bottomAnchor, constant: -1).isActive = true
        durationLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
