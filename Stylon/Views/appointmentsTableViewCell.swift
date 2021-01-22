//
//  appointmentsTableViewCell.swift
//  Stylon
//
//  Created by Macbook on 07/02/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class appointmentsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.shadowView()
        deleteBtn.shadowView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
