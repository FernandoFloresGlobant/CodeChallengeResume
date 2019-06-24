//
//  GLBResumeCodeChallengeTests.swift
//  GLBResumeCodeChallengeTests
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest
@testable import GLBResumeCodeChallenge

class GLBResumeCodeChallengeTests: XCTestCase
{
    var homeVC: GLBResumeHomeViewController!

    override func setUp()
    {
        homeVC = GLBResumeHomeViewController()
        
        _ = homeVC.view // To call viewDidLoad
    }

    override func tearDown()
    {
        homeVC = nil
        super.tearDown()
    }

    func testHomeTableViewExists()
    {
        XCTAssert(homeVC.tableView != nil)
    }
    
    func testTableViewShowCorrectNumberOfSection()
    {
        let validJSON = [[
            "section_id": 0,
            "section_name": "Datos Personales",
            "name": "Fernando Flores",
            "address": "Iturbide 33, Ecatepec",
            "mail": "fernando@globant.com",
            "cel": "5540204040"]]
        
        let expectation = self.expectation(description: "testReturnsSuccessfulDictionary")
        
        let urlSession = URLSessionMock()
        
        let jsonData = try? JSONSerialization.data(withJSONObject: validJSON, options: [])
        
        urlSession.mockData = jsonData
        urlSession.mockError = nil
        
        let client = GLBResumeAPIClient(baseUrl: .base, urlSession: urlSession)
        
        var testError: HttpError?
        
        client.request(endpoint: .info, httpMethod: .GET) { result in
        
            switch result
            {
            case .successful(let resultData):
                
                self.homeVC.sections = resultData
                self.homeVC.tableView?.reloadData()
                
            case .failed(let resultError):
                
                testError = resultError
            }
            
            expectation.fulfill()
        }
        
        XCTWaiter().wait(for: [expectation], timeout: 1.0)

        XCTAssertNil(testError)
        
        let sections = homeVC.tableView?.numberOfSections
        XCTAssert(sections == 1)
    }

    func testTableViewShowCorrectNumberOfRowsForOneRow()
    {
        let validJSON = [[
            "section_id": 0,
            "section_name": "Datos Personales",
            "name": "Fernando Flores",
            "address": "Iturbide 33, Ecatepec",
            "mail": "fernando@globant.com",
            "cel": "5540204040"]]

        let expectation = self.expectation(description: "testReturnsSuccessfulDictionary")

        let urlSession = URLSessionMock()

        let jsonData = try? JSONSerialization.data(withJSONObject: validJSON, options: [])

        urlSession.mockData = jsonData
        urlSession.mockError = nil

        let client = GLBResumeAPIClient(baseUrl: .base, urlSession: urlSession)

        var testError: HttpError?

        client.request(endpoint: .info, httpMethod: .GET) { result in

            switch result
            {
            case .successful(let resultData):

                self.homeVC.sections = resultData
                self.homeVC.tableView?.reloadData()

            case .failed(let resultError):

                testError = resultError
            }

            expectation.fulfill()
        }

        XCTWaiter().wait(for: [expectation], timeout: 1.0)

        XCTAssertNil(testError)

        guard let table = homeVC.tableView else { return }
        let rows = homeVC.tableView(table, numberOfRowsInSection: 0)
        XCTAssert(rows == 1)
    }

    func testTableViewShowCorrectNumberOfRowsForTwoRows()
    {
        let validJSON = [[
                        "section_id": 0,
                        "section_name": "Datos Personales",
                        "name": "Fernando Flores",
                        "address": "Iturbide 33, Ecatepec",
                        "mail": "fernando@globant.com",
                        "cel": "5540204040"],
                         [
                        "section_id": 1,
                        "section_name": "Historial Laboral"]]

        let expectation = self.expectation(description: "testReturnsSuccessfulDictionary")

        let urlSession = URLSessionMock()

        let jsonData = try? JSONSerialization.data(withJSONObject: validJSON, options: [])

        urlSession.mockData = jsonData
        urlSession.mockError = nil

        let client = GLBResumeAPIClient(baseUrl: .base, urlSession: urlSession)

        var testError: HttpError?

        client.request(endpoint: .info, httpMethod: .GET) { result in

            switch result
            {
            case .successful(let resultData):

                self.homeVC.sections = resultData
                self.homeVC.tableView?.reloadData()

            case .failed(let resultError):

                testError = resultError
            }

            expectation.fulfill()
        }

        XCTWaiter().wait(for: [expectation], timeout: 1.0)

        XCTAssertNil(testError)

        guard let table = homeVC.tableView else { return }
        let rows = homeVC.tableView(table, numberOfRowsInSection: 0)
        XCTAssert(rows == 2)
    }

    func testTableViewShowCorrectNumberOfRowsForThreeRows()
    {
        let validJSON = [[
                        "section_id": 0,
                        "section_name": "Datos Personales",
                        "name": "Fernando Flores",
                        "address": "Iturbide 33, Ecatepec",
                        "mail": "fernando@globant.com",
                        "cel": "5540204040"],
                         [
                            "section_id": 1,
                            "section_name": "Historial Laboral"],
                         [
                            "section_id": 2,
                            "section_name": "Historial Academico"]]

        let expectation = self.expectation(description: "testReturnsSuccessfulDictionary")

        let urlSession = URLSessionMock()

        let jsonData = try? JSONSerialization.data(withJSONObject: validJSON, options: [])

        urlSession.mockData = jsonData
        urlSession.mockError = nil

        let client = GLBResumeAPIClient(baseUrl: .base, urlSession: urlSession)

        var testError: HttpError?

        client.request(endpoint: .info, httpMethod: .GET) { result in

            switch result
            {
            case .successful(let resultData):

                self.homeVC.sections = resultData
                self.homeVC.tableView?.reloadData()

            case .failed(let resultError):

                testError = resultError
            }

            expectation.fulfill()
        }

        XCTWaiter().wait(for: [expectation], timeout: 1.0)

        XCTAssertNil(testError)

        guard let table = homeVC.tableView else { return }
        let rows = homeVC.tableView(table, numberOfRowsInSection: 0)
        XCTAssert(rows == 3)
    }

    func testLaboralCellProperlyAssignValues()
    {
        let laboralCell = Bundle.main.loadNibNamed("GLBResumeLaboralTableViewCell", owner: self, options: nil)![0] as? GLBResumeLaboralTableViewCell

        var job = GLBResumeHomeSection.GLBResumeJob()
        job.name = "TestCompany"
        job.startDate = "Julio 2017"
        job.endDate = "Actual"
        job.position = "CEO"

        laboralCell?.configureCellWith(job: job)

        XCTAssertNotNil(laboralCell)
        XCTAssert(laboralCell?.lbCompany?.text == job.name)
        var time = ""
        if let start = job.startDate, let end = job.endDate
        {
            time = "\(start) - \(end)"
        }
        XCTAssert(laboralCell?.lbTime?.text == time)
        XCTAssert(laboralCell?.lbPosition?.text == job.position)
    }

    func testScholarCellProperlyAssignValues()
    {
        let schoolCell = Bundle.main.loadNibNamed("GLBResumeScholarTableViewCell", owner: self, options: nil)![0] as? GLBResumeScholarTableViewCell

        var school = GLBResumeHomeSection.GLBResumeSchool()
        school.name = "Stanford"
        school.startDate = "2007"
        school.endDate = "2011"
        school.degree = "Ingeniero en Sistemas Computacionales"

        schoolCell?.configureCellWith(school: school)

        XCTAssertNotNil(schoolCell)
        XCTAssert(schoolCell?.lbName?.text == school.name)
        var time = ""
        if let start = school.startDate, let end = school.endDate
        {
            time = "\(start) - \(end)"

        }
        XCTAssert(schoolCell?.lbTime?.text == time)
        XCTAssert(schoolCell?.lbDegree?.text == school.degree)
    }
}
