//
//  myCustomTableViewCell.swift
//  Assignment2-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-24.
//

import UIKit

class myCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
