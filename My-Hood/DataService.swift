//
//  DataService.swift
//  My-Hood
//
//  Created by Atef H Ataya on 12/10/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import Foundation
import UIKit // must add in order to use UIImage


class DataService {
    static let instatnce = DataService()
    // only once it will create this instance, because of the static
    // globally accessible skeleton, it lives in the memory and never cleaned up unless you delete the application.
    let KEY_POSTS = "posts"
    private var _loadedPosts  = [Post]() // safeway with array
    
    var loadedPosts: [Post] {
        return _loadedPosts
    }
    
    func savePosts () {
        
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func loadPosts () {
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
                _loadedPosts = postsArray
                
            }
        }
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
    }
    
    //convert image to data to save it
    func saveImageAndCreatePath (image: UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    //loading image
    func imageForPath(path: String) -> UIImage? {
        let fullPath = documentsPathForFileName(path)
        let image = UIImage(named: fullPath)
        return image
    }
    
    func addPost (post: Post) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
        
    }
    
    //function to create a directory for saving the image
    func documentsPathForFileName(name: String) -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true)
        let fullPath = path[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
}