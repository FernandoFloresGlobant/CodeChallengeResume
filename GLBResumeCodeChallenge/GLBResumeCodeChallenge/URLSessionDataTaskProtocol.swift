//
//  URLSessionDataTaskProtocol.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando on 6/23/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol
{
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }

protocol URLSessionProtocol: class
{
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol
{
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
    {
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
    }
}
