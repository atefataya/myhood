//
//  ViewController.swift
//  My-Hood
//
//  Created by Atef H Ataya on 12/9/15.
//  Copyright © 2015 Atef H Ataya. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //tableView.estimatedRowHeight = 82
        
        DataService.instatnce.loadPosts()
        
       NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded", name: "postsLoaded", object: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instatnce.loadedPosts.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let post = DataService.instatnce.loadedPosts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            
            //you got a cell, I will use it and update the data in it, we will cast it as Post Cell.
            cell.configureCell(post)
            return cell
            
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
        
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 82.0
    }
    
    func onPostsLoaded (){
        tableView.reloadData()
    }
    
//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        // to take you some where else after we clicked on the cell
//    }
//    
    
}

