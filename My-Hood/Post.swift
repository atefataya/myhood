//
//  Post.swift
//  My-Hood
//
//  Created by Atef H Ataya on 12/9/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import Foundation

class Post {
    private var _imagePath: String
    private var _title: String
    private var _postDesc: String
    
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
    
    
}