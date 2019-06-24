//
//  GLBResumeCodeChallengeUITests.swift
//  GLBResumeCodeChallengeUITests
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import XCTest

class GLBResumeCodeChallengeUITests: XCTestCase
{
    override func setUp()
    {
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launch()
    }

    func testHomeTableViewExist()
    {
        let app = XCUIApplication()
        
        XCTAssert(app.tables["homeTableViewAId"].exists)
    }
    
    func testShowPersonalInfoWhenCorrespondingCellIsTapped()
    {
        let app = XCUIApplication()
        
        app.tables.cells.element(boundBy: 0).tap()
        
        XCTAssert(app.otherElements["personalInfoViewAId"].exists)
    }
    
    func testShowLaboralHistoryWhenCorrespondingCellIsTapped()
    {
        let app = XCUIApplication()
        
        app.tables.cells.element(boundBy: 1).tap()
        
        XCTAssert(app.tables["laboralTableViewAId"].exists)
    }

    func testShowSchoolHistoryWhenCorrespondingCellIsTapped()
    {
        let app = XCUIApplication()
        
        app.tables.cells.element(boundBy: 2).tap()
        
        XCTAssert(app.tables["schoolTableViewAId"].exists)
    }
}
