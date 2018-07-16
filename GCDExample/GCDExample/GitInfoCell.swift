//
//  GitInfoCell.swift
//  GCDExample
//
//  Created by Can Khac Nguyen on 7/16/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit

class GitInfoCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOwnerID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
