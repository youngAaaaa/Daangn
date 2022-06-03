//
//  CategoryTableViewCell.swift
//  Daangn
//
//  Created by macbook air on 2022/06/01.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellUpdate(_ category: ProductCategory) {
        categoryLabel.text = category.rawValue
    }
}
