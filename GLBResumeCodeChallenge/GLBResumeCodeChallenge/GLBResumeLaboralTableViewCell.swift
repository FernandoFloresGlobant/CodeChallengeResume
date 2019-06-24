//
//  GLBResumeLaboralTableViewCell.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class GLBResumeLaboralTableViewCell: UITableViewCell
{
    @IBOutlet weak var lbCompany: UILabel?
    @IBOutlet weak var lbTime: UILabel?
    @IBOutlet weak var lbPosition: UILabel?

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
    
    func configureCellWith(job: GLBResumeHomeSection.GLBResumeJob)
    {
        lbCompany?.text = job.name
        if let start = job.startDate, let end = job.endDate
        {
            lbTime?.text = "\(start) - \(end)"
        }
        lbPosition?.text = job.position
    }
}
