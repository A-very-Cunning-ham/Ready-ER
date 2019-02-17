//
//  TableViewCell.swift
//  ReadyER2
//
//  Created by Ali Alobaidi on 2/17/19.
//  Copyright © 2019 Ali Alobaidi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var checkLblCell: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
