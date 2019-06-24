//
//  GLBResumePersonalDataViewController.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

let kPersonalDataTitle = "Personal Info"
let kPersonalDataViewAId = "personalInfoViewAId"
let kPersonalDataName = "Name:"
let kPersonalDataAddress = "Address:"
let kPersonalDataMail = "Mail:"
let kPersonalDataPhone = "Phone:"

class GLBResumePersonalDataViewController: UIViewController
{
    @IBOutlet weak var lbTitleName: UILabel?
    @IBOutlet weak var lbName: UILabel?
    @IBOutlet weak var lbTitleAddress: UILabel?
    @IBOutlet weak var lbAddress: UILabel?
    @IBOutlet weak var lbTitleMail: UILabel?
    @IBOutlet weak var lbMail: UILabel?
    @IBOutlet weak var lbTitleCel: UILabel?
    @IBOutlet weak var lbCel: UILabel?

    var personalInfo: GLBResumeHomeSection.GLBResumePersonalInfo?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.accessibilityIdentifier = kPersonalDataViewAId

        self.title = NSLocalizedString(kPersonalDataTitle, comment: "")
        
        setUpLabelTexts()
        
        configWith(info: personalInfo)
    }

    func setUpLabelTexts()
    {
        lbTitleName?.text = NSLocalizedString(kPersonalDataName, comment: "")
        lbTitleAddress?.text = NSLocalizedString(kPersonalDataAddress, comment: "")
        lbTitleMail?.text = NSLocalizedString(kPersonalDataMail, comment: "")
        lbTitleCel?.text = NSLocalizedString(kPersonalDataPhone, comment: "")
    }

    func configWith(info: GLBResumeHomeSection.GLBResumePersonalInfo?)
    {
        lbName?.text = personalInfo?.name
        lbAddress?.text = personalInfo?.address
        lbMail?.text = personalInfo?.mail
        lbCel?.text = personalInfo?.cel
    }
}
