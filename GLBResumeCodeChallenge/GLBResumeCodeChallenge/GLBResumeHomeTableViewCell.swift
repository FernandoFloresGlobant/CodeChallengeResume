//
//  GLBResumeHomeTableViewCell.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class GLBResumeHomeTableViewCell: UITableViewCell
{
    @IBOutlet weak var lbText: UILabel?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCellWith(text: String)
    {
        lbText?.text = text
    }
}
