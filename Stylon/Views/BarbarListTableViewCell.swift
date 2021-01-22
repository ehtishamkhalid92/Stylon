//
//  BarbarListTableViewCell.swift
//  Stylon
//
//  Created by Macbook on 05/02/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class BarbarListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLbl.layer.cornerRadius = 6
        nameLbl.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameLbl.layer.borderWidth = 1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
