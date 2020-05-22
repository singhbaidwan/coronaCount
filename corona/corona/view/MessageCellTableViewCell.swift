//
//  MessageCellTableViewCell.swift
//  corona
//
//  Created by Dalveer singh on 10/04/20.
//  Copyright © 2020 Dalveer singh. All rights reserved.
//

import UIKit

class MessageCellTableViewCell: UITableViewCell {

//    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var confiremedCases: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
