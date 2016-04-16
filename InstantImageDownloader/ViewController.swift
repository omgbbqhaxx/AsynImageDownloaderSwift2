//
//  ViewController.swift
//  InstantImageDownloader
//
//  Created by Homeros Bilişim on 16.04.2016.
//  Copyright © 2016 Homeros Bilişim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Async






class ViewController: UIViewController, UITableViewDelegate {

    var Instagramjson :JSON = []
    var group = AsyncGroup()
    
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
      
        
            Alamofire.request(.GET, "https://api.instagram.com/v1/media/popular?client_id=%20df71db760d5a46de9ba167451699712a")
                .responseJSON {
                    
                    response in
                    
                    self.Instagramjson = JSON(response.result.value!)
                    print(self.Instagramjson["data"].count)
                    self.tableView.reloadData()
            }
            print("req tamalandı q")
    
    }
    
    
   
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Instagramjson["data"].count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyImagesCell
        
      
        let username: JSON = self.Instagramjson["data"][indexPath.row]["user"]["username"]
        
        let usernameString : NSString = username.stringValue
        
        cell.myLabel.text = usernameString as String
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.profileImage.image = UIImage(named: "atom.jpg")
        
        
        let myurl: JSON = self.Instagramjson["data"][indexPath.row]["user"]["profile_picture"]
        let myurlString : NSString = myurl.stringValue
        let sel = #selector(cell.downloadAndFill(_:))
        cell.performSelectorInBackground(sel , withObject: myurlString)
        
        
        let profilePicture: JSON = self.Instagramjson["data"][indexPath.row]["images"]["low_resolution"]["url"]
        let profilePictureString : NSString = profilePicture.stringValue
        let seltwo = #selector(cell.downloadProfileImage(_:))
        cell.performSelectorInBackground(seltwo , withObject: profilePictureString)
        
        
    
    
        
        
        return cell
        
    }
    
    

  
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

