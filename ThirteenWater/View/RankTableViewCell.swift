//
//  RankTableViewCell.swift
//  ThirteenWater
//
//  Created by Zhouxinhuang on 2019/10/13.
//  Copyright © 2019 Zhouxinhuang. All rights reserved.
//

import UIKit

class RankTableViewCell: UITableViewCell {
    static let identifier = "RankTableViewCell"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
