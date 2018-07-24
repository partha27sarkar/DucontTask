//
//  MainTableViewCell.swift
//  ParthaSarkarAssignment
//
//  Created by Partha Sarkar on 24/07/18.
//  Copyright © 2018 Partha Sarkar. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    
    var setData:NYTimeModel? = nil {
        didSet{
            guard let data = setData else {return}
            self.imgCell.layer.cornerRadius = self.imgCell.bounds.width * 0.5
            self.imgCell.layer.borderColor = UIColor.gray.cgColor
            self.imgCell.layer.borderWidth = 1.0
            
            self.labelTitle.text = data.title
            self.lblDesc.text = data.byline
            self.lblDate.text = data.published_date
            self.lblType.text = data.type
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
