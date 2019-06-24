//
//  GLBResumeAPIClientMock.swift
//  GLBResumeCodeChallengeTests
//
//  Created by Fernando on 6/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

//import Foundation
import XCTest
@testable import GLBResumeCodeChallenge

class GLBResumeAPIClientMock: GLBResumeAPIClientProtocol
{
    private(set) var endpointReceived: GLBResumeURL?
    private(set) var httpMethodReceived: HttpMethod?

    var mockResult: Result<[GLBResumeHomeSection]>?
    var mockError: Error?
    
    func request(endpoint: GLBResumeURL, httpMethod: HttpMethod, onCompletion: completeClosure?)
    {
        endpointReceived = endpoint
        httpMethodReceived = httpMethod
        
        if let result = mockResult
        {
            onCompletion?(result)
        }
    }
}

class URLSessionMock: URLSessionProtocol
{
    private (set) var requestReceived: URLRequest?
    
    // mock values to be used as response
    var mockData: Data?
    var mockURLResponse: URLResponse?
    var mockError: Error?
    var mockURLSessionDataTask: URLSessionDataTaskProtocol?
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        
        requestReceived = request
        
        completionHandler(mockData, mockURLResponse, mockError)
        
        return mockURLSessionDataTask ?? URLSessionDataTaskMock()
    }
}

class URLSessionDataTaskMock: URLSessionDataTaskProtocol
{
    private(set) var hasResumeBeenCalled = false
    
    func resume()
    {
        hasResumeBeenCalled = true
    }
}
