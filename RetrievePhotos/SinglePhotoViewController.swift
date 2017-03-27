//
//  SinglePhotoViewController.swift
//  RetrievePhotos
//
//  Created by Chrishon Wyllie on 3/27/17.
//  Copyright © 2017 Chrishon Wyllie. All rights reserved.
//

import UIKit
import Photos

class SinglePhotoViewController: UIViewController {
    
    let imgManager = PHImageManager.default()
    
    
    var reqOptions: PHImageRequestOptions? {
        didSet {
            if let _reqOptions = reqOptions {
                _reqOptions.isSynchronous = true
            }
        }
    }
    
    var asset: PHAsset? {
        didSet {
            if let _asset = asset {
                
                
                let width = 300 //self.frame.size.width
                let height = 300 //self.frame.size.height
                
                let thumbnailSize: CGSize = CGSize(width: width, height: height)
                
                imgManager.requestImage(for: _asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: reqOptions, resultHandler: { (image, info) in
                    self.assetImageView.image = image
                })
            }
        }
    }
    

    
    var assetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(assetImageView)
        
        assetImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        assetImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        assetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        assetImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //assetImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
