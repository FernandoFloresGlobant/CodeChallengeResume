//
//  GLBResumeScholarTableViewCell.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

class GLBResumeScholarTableViewCell: UITableViewCell
{
    @IBOutlet weak var lbName: UILabel?
    @IBOutlet weak var lbTime: UILabel?
    @IBOutlet weak var lbDegree: UILabel?

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
    
    func configureCellWith(school: GLBResumeHomeSection.GLBResumeSchool)
    {
        lbName?.text = school.name
        if let start = school.startDate, let end = school.endDate
        {
            lbTime?.text = "\(start) - \(end)"
        }
        lbDegree?.text = school.degree
    }
}
