//
//  MainTableViewCell.swift
//  Daangn
//
//  Created by macbook air on 2022/06/01.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainCellImage: UIImageView!
    @IBOutlet weak var mainCellTitle: UILabel!
    @IBOutlet weak var mainCellAddress: UILabel!
    @IBOutlet weak var mainCellPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainCellImage.layer.cornerRadius = CGFloat(10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellUpdate(_ data: PostingProduct) {
        mainCellImage.image = UIImage(named: data.image)
        mainCellTitle.text = data.title
        mainCellAddress.text = data.writer.address
        guard let price = data.price else {
            mainCellPrice.text = ""
            return
        }
        
        if price == 0 {
            mainCellPrice.text = "나눔🧡"
        }
    }
    
    
}
