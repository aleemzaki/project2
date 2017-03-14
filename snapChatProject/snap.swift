//
//  snap.swift
//  snapChatProject
//
//  Created by Aleem on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation

import UIKit
class snap :UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var fullScreen = UIImage()
    @IBOutlet var snapFullOutlet: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        snapFullOutlet.dataSource = self
        snapFullOutlet.delegate = self
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let temp = tableView.dequeueReusableCell(withIdentifier: "snapCell", for: indexPath) as? snapCell
        temp?.snapFullScreen.image = fullScreen
        
        return temp!
    }
    
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "snapToFeed", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "snapToFeed" {
            //let destination = segue.destination as? feedController
            //destination?.snapStatus = UIImage(named: "read")
        }
    }
}
