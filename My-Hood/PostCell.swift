//
//  PostCell.swift
//  My-Hood
//
//  Created by Atef H Ataya on 12/9/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//
// This is the View which is used for the cell
import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
    }

    func configureCell (post: Post) {
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataService.instatnce.imageForPath(post.imagePath)
    }

}
