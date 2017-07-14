//
//  stacksItemCell.swift
//  xiaoMingBook
//
//  Created by renminghe on 2017/7/14.
//  Copyright © 2017年 任茗赫. All rights reserved.
//

import UIKit

class stacksItemCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var auther: UILabel!
    @IBOutlet weak var textCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
