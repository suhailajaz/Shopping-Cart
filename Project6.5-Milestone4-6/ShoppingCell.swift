//
//  ShoppingCell.swift
//  Project6.5-Milestone4-6
//
//  Created by suhail on 13/07/23.
//

import UIKit

class ShoppingCell: UITableViewCell {
   
    static let identifier = "ShoppingCell"
    static let nib = UINib(nibName: "ShoppingCell", bundle: nil)
    
    @IBOutlet var vwCellBg: UIView!
    @IBOutlet var lblCurrentItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vwCellBg.layer.cornerRadius = 20
        vwCellBg.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
