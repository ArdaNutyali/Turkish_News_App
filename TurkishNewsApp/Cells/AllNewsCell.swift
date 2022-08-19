//
//  AllNewsCell.swift
//  TurkishNewsApp
//
//

import UIKit

class AllNewsCell: UITableViewCell {

    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
