//
//  HistoryTableViewCell.swift
//  ThirteenWater
//
//  Created by Zhouxinhuang on 2019/10/14.
//  Copyright © 2019 Zhouxinhuang. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    static let identifer = "HistoryTableViewCell"
    @IBOutlet weak var gameID: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
