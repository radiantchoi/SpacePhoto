//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Gordon Choi on 2021/06/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dailyImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            guard let photoInfo = photoInfo else { return }
            self.title = photoInfo.title
            self.descriptionLabel.text = photoInfo.description
            if let copyright = photoInfo.copyright {
                self.copyrightLabel.text = photoInfo.copyright
            } else {
                self.copyrightLabel.isHidden = true
            }
        }
    }
    
}

