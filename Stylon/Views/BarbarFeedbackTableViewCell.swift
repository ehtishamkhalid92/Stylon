//
//  BarbarFeedbackTableViewCell.swift
//  Stylon
//
//  Created by Ehtisham Khalid on 07/02/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class BarbarFeedbackTableViewCell: UITableViewCell {
    @IBOutlet weak var RoundLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var feedbackLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
