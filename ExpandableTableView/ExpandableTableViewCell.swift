//
//  ExpandableTableViewCell.swift
//  ExpandableTableView
//
//  Created by Xin Wang on 8/10/16.
//  Copyright © 2016 Xin Wang. All rights reserved.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!

    @IBOutlet weak var detailLabelHeightConstraint: NSLayoutConstraint!
    
    func toggleVisibility(expand: Bool) {
        if expand {
            // get height
            detailLabel.sizeToFit()
            detailLabelHeightConstraint.constant = detailLabel.bounds.height
        } else {
            detailLabelHeightConstraint.constant = 0
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
