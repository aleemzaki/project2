//
//  feedController.swift
//  snapChatProject
//
//  Created by Aleem on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit
class feedController : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var feedOutlet: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var inputIntoThisFeed = String()
    var tempImage = UIImage()
    
    override func viewDidLoad() {
        feedOutlet.dataSource = self
        feedOutlet.delegate = self
        super.viewDidLoad()
        //convert2()
        //print("counter")
       // counter = 0
        //countThreads()
    }
    var k = Int()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tableView.reloadData()
        return threads[threadNames[section]]!.count
        
        //return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? feedCell
        if temp?.read == true{
        temp?.snapStatus.image = UIImage(named:
            "read")} else {
            temp?.snapStatus.image = UIImage(named:
                "unread")
        }
        temp?.read = false
        temp?.snapAgeLabel.text = "Sent by Aleem Zaki"
        temp?.senderNameLabel.text = "6 minutes ago"
        //temp?.read = true
        return temp!
        
    }
    var counter = Int()
    func countThreads(){
        
        for _ in threads.keys {
            counter = counter + 1
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return threads.count
    }
    var stringArr2 = [String]()
    func convert2(){
        
        for name in threads.keys {
            //print()
            stringArr2.append(name)
            
        }
    }
    var i = Int()
    //i = 0
    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int)->String?
    {
        print(section)
        i = 0
        for name in threads.keys {
            if section == i {
                return name
            }
            i = i + 1
        }
        
        return "clapAlong"
    }
    var feedName = String()
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        i = 0
        for name in threads.keys {
            if indexPath.section == i {
                feedName = name
            }
            i = i + 1
        }
        let temp = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? feedCell
        temp?.read = true
        
        //indexPath.section
        //performSegue(withIdentifier: "filemenuToFeed", sender: nil)
        tempImage = (threads[feedName]?[indexPath.row])!
        performSegue(withIdentifier: "feedToSnap", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "feedToSnap" {
            let destination = segue.destination as? snap
            destination?.fullScreen = tempImage
            
        }
    }
    /*
    func selectImage(_ image: UIImage) {
        //The image being selected is passed in as "image".
        
        //selectedIndexPath = indexPath
        chosenImage = image
        performSegue(withIdentifier: "camToFileMenu", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "camToFileMenu" {
            let destination = segue.destination as? fileMenuController
            destination?.selectedImage = chosenImage
        }
    }
    */
}
