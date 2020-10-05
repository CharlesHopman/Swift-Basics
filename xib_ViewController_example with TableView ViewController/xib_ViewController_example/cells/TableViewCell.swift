//
//  TableViewCell.swift
//  xib_ViewController_example
//
//  Created by Charles Hopman on 9/29/20.
//  Copyright © 2020 Charles Hopman. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var xibLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        print("selected state")
    }
    
}
