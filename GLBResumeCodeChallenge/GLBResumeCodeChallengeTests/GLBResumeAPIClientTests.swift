//
//  GLBResumeAPIClientTests.swift
//  GLBResumeCodeChallengeTests
//
//  Created by Fernando on 6/21/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import Foundation
import XCTest
@testable import GLBResumeCodeChallenge

class GLBResumeAPIClientTests: XCTestCase
{
    func testReturnsErrorWhenErrorIsNotNilFromServer()
    {
        let expectation = self.expectation(description: "testReturnsSuccessfulDictionary")
        
        let urlSession = URLSessionMock()
        urlSession.mockData = nil

        let unknownError = NSError(domain:"", code:400, userInfo:nil)
        urlSession.mockError = unknownError as Error

        let client = GLBResumeAPIClient(baseUrl: .base, urlSession: urlSession)
        
        var testData: [GLBResumeHomeSection]?
        var testError: HttpError?
        
        client.request(endpoint: .info, httpMethod: .GET) { result in
        
            switch result {
                
            case .successful(let resultData):
                
                testData = resultData
                
            case .failed(let resultError):
                
                testError = resultError
            }
            
            expectation.fulfill()
        }
        
        XCTWaiter().wait(for: [expectation], timeout: 1.0)
        
        XCTAssertNil(testData)
        XCTAssertNotNil(testError)
    }
    
    func testReturnsDataWhenReceivesVaildJSONFromServer()
    {
        let validJSON = [[
            "section_id": 0,
            "section_name": "Datos Personales",
            "name": "Fernando Flores",
            "address": "Iturbide 33, Ecatepec",
            "mail": "fernando.flores@globant.com",
            "cel": "5540204062"]]
        
        let expectation = self.expectation(description: "testReturnsSuccessfulDictionary")
        
        let urlSession = URLSessionMock()
        
        let jsonData = try? JSONSerialization.data(withJSONObject: validJSON, options: [])
        
        urlSession.mockData = jsonData
        urlSession.mockError = nil
        
        let client = GLBResumeAPIClient(baseUrl: .base, urlSession: urlSession)
        
        var testJson: [GLBResumeHomeSection]?
        var testError: HttpError?
        
        client.request(endpoint: .info, httpMethod: .GET) { result in
        
            switch result {
                
            case .successful(let resultData):
                
                testJson = resultData
                
            case .failed(let resultError):
                
                testError = resultError
            }

            expectation.fulfill()
        }
        
        XCTWaiter().wait(for: [expectation], timeout: 1.0)
        
        XCTAssertNotNil(testJson)
        XCTAssertNil(testError)
    }
}
