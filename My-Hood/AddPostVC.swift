//
//  AddPostVC.swift
//  My-Hood
//
//  Created by Atef H Ataya on 12/10/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //When use image picker we must use the above two delegate

    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        

    }

    @IBAction func makePostButtonPressed(sender: AnyObject) {
        if let title = titleField.text, let desc = descField.text, let img = postImage.image {
            let imgPath = DataService.instatnce.saveImageAndCreatePath(img)
            let post = Post(imgPath: imgPath    , title: title, description: desc)
            DataService.instatnce.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addPicButtonPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //This function will be called immediately after we select the image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
    }
}
