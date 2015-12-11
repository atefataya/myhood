//
//  Post.swift
//  My-Hood
//
//  Created by Atef H Ataya on 12/9/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//
// Class Model
import Foundation

class Post: NSObject, NSCoding  {
    
    //inherit from the NSobject because we want to save the data and archive
    private var _imagePath: String!
    private var _title: String!
    private var _postDesc: String!
    
    var imagePath: String {
  
        return _imagePath

    }
    
    var title: String {
        
        return _title
    }
    
    var postDesc: String{
        return _postDesc
    }
    
    init(imgPath: String, title: String, description: String) {
        self._imagePath = imgPath
        self._title = title
        self._postDesc = description
    }
    
    override init(){
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init() // must initialize myself when decoding
        //decoding
        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("description") as? String
        
    }
    
    //Function to encode
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
        aCoder.encodeObject(self._postDesc, forKey: "description")
        aCoder.encodeObject(self._title, forKey: "title")
    }
    
  
}