//
//  fileMenuController.swift
//  snapChatProject
//
//  Created by Aleem on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class fileMenuController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var fileMenuTableView: UITableView!
    
    var selectedImage = UIImage()
    var selectedFeed = String()
    override func viewDidLoad() {
        fileMenuTableView.dataSource = self
        fileMenuTableView.delegate = self
        super.viewDidLoad()
        convert()
        print(stringArr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //HOW MANY FEEDS ARE THERE?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return threads.count
        
    }
    
    var stringInst = String()
    var stringArr = [String]()
    var iterater = Int()
    
    
    func convert(){
        
        for name in threads.keys {
            //print()
            stringArr.append(name)
            
        }
    }
    
    //WHAT IS EACH FEED'S NAME?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "fileMenuCell", for: indexPath) as? fileMenuCell
        //let p = 9
        //let feeditem = threads["Memes"]
        //temp?.feedNameLabel.text = threads[indexPath.item].keyFromDictionary()
        //convert()
        
        temp?.feedNameLabel.text = stringArr[indexPath.item]
        return temp!
        
    }
    
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFeed = stringArr[indexPath.item]
        
        
        for name in threads.keys {
            if name == selectedFeed {
                threads[name]?.append(selectedImage)
            }
        }
        
        
        //performSegue(withIdentifier: "filemenuToFeed", sender: nil)
        
    }
    //@objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, //didSelectRowAt indexPath: IndexPath) {
        
      //  performSegue(withIdentifier: "filemenuToFeed" sender: nil)
        
   // }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        
        
        //if segue.identifier == "filemenuToFeed" {
        //    let destination = segue.destination as? feedController
        //    destination?.inputIntoThisFeed = selectedFeed
        //}
    }
}
