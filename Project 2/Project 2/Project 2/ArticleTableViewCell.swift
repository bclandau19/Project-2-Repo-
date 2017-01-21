//
//  ArticleTableViewCell.swift
//  Project 2
//
//  Created by Benjamin Landau on 12/16/16.
//  Copyright © 2016 Benjamin Landau. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var authorLabelOutlet: UILabel!
    
    @IBOutlet weak var titleLabelOutlet: UILabel!
    
    @IBOutlet weak var dateLabelOutlet: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
