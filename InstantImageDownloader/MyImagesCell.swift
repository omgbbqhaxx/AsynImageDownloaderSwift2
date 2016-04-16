//
//  MyImagesCell.swift
//  InstantImageDownloader
//
//  Created by Homeros Bilişim on 16.04.2016.
//  Copyright © 2016 Homeros Bilişim. All rights reserved.
//

import UIKit
import Kingfisher




class MyImagesCell: UITableViewCell {
    
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func imageFiller(imagename: NSString)  {

        
        self.testImage?.kf_setImageWithURL(NSURL(string: imagename as String)!)
    }
    
    
    func downloadAndFill(name : NSString) {
        let sel = #selector(self.imageFiller(_:))
        self.performSelectorOnMainThread(sel, withObject: name, waitUntilDone: true)

    }
    
    
    
    func profileImageFiller(imagename: NSString)  {
        
        
        self.profileImage?.kf_setImageWithURL(NSURL(string: imagename as String)!)
    }
    
    func downloadProfileImage(name : NSString) {
        let sel = #selector(self.profileImageFiller(_:))
        self.performSelectorOnMainThread(sel, withObject: name, waitUntilDone: true)
        
    }

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
   

    

}
