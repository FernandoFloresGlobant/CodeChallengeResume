//
//  GLBResumeSectionsProvider.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando on 6/26/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

let kLocalizedPersonalInfo = "Personal Info"
let kLocalizedLaboralHistory = "Laboral History"
let kLocalizedSchoolHistory = "School History"

enum SectionType: Int
{
    case personalInfo
    case laboral
    case school
}

class GLBResumeSectionsProvider
{
    var viewController: UIViewController? = nil

    func nameForSectionWith(type: SectionType, homeSections: [GLBResumeHomeSection]) -> String
    {
        switch type
        {
        case .personalInfo:
            return NSLocalizedString(kLocalizedPersonalInfo, comment: "")
        case .laboral:
            return NSLocalizedString(kLocalizedLaboralHistory, comment: "")
        case .school:
            return NSLocalizedString(kLocalizedSchoolHistory, comment: "")
        }
    }
    
    func prepareDetailForSectionWith(type: SectionType, homeSections: [GLBResumeHomeSection])
    {
        switch type
        {
        case .personalInfo:
            if let personalInfo = homeSections[type.rawValue].personalInfo
            {
                let vc = GLBResumePersonalDataViewController()
                vc.personalInfo = personalInfo
                viewController?.navigationController?.pushViewController(vc, animated: true)
            }
        case .laboral:
            if let jobs = homeSections[type.rawValue].jobs
            {
                let vc = GLBResumeLaboralViewController()
                vc.jobs = jobs
                viewController?.navigationController?.pushViewController(vc, animated: true)
            }
        case .school:
            if let schools = homeSections[type.rawValue].schools
            {
                let vc = GLBResumeScholarViewController()
                vc.schools = schools
                viewController?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

    func handleResponse(response:Result<[GLBResumeHomeSection]>)
    {
        if let vc = viewController as? GLBResumeHomeViewController
        {
            switch response
            {
            case .successful(let sections):
                vc.sections = sections
                
                DispatchQueue.main.async {
                    vc.tableView?.reloadData()
                }
            case .failed( _):
                
                let message = NSLocalizedString(kErrorMessage, comment: "")
                vc.showErrorMessage(message: message)
            }
        }
    }
}
