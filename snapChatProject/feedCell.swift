//
//  feedCell.swift
//  snapChatProject
//
//  Created by Aleem on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit
class feedCell: UITableViewCell {
    

    @IBOutlet weak var snapStatus: UIImageView!
    @IBOutlet weak var senderNameLabel: UILabel!
    
    @IBOutlet weak var snapAgeLabel: UILabel!
    var read : Bool = false    //self.read.setBool(true)
}
