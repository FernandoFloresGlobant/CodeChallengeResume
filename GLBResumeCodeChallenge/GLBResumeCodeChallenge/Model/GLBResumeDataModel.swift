//
//  GLBResumeDataModel.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando on 6/26/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

struct GLBResumeHomeSection: Codable
{
    var personalInfo: GLBResumePersonalInfo?
    var jobs: [GLBResumeJob]?
    var schools: [GLBResumeSchool]?
    
    enum CodingKeys: String, CodingKey
    {
        case personalInfo = "personal_info"
        case jobs = "jobs"
        case schools = "schools"
    }
    
    struct GLBResumePersonalInfo: Codable
    {
        var name: String?
        var address: String?
        var mail: String?
        var cel: String?
    }
    
    struct GLBResumeJob: Codable
    {
        var name: String?
        var startDate: String?
        var endDate: String?
        var position: String?
        
        enum CodingKeys: String, CodingKey
        {
            case name = "company"
            case startDate = "start_date"
            case endDate = "end_date"
            case position = "position"
        }
    }
    
    struct GLBResumeSchool: Codable
    {
        var name: String?
        var startDate: String?
        var endDate: String?
        var degree: String?
        
        enum CodingKeys: String, CodingKey
        {
            case name = "school"
            case startDate = "start_date"
            case endDate = "end_date"
            case degree = "degree"
        }
    }
}
