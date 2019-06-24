//
//  GLBResumeAPIClientProtocol.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando on 6/23/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

protocol GLBResumeAPIClientProtocol
{
    func request(endpoint: GLBResumeURL, httpMethod: HttpMethod, onCompletion: completeClosure?)
}
