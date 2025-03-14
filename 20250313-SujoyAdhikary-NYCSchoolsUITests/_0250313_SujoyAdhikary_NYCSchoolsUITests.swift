//
//  _0250313_SujoyAdhikary_NYCSchoolsUITests.swift
//  20250313-SujoyAdhikary-NYCSchoolsUITests
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import XCTest

//final class _0250313_SujoyAdhikary_NYCSchoolsUITests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
////    @MainActor
////    func testExample() throws {
////        // UI tests must launch the application that they test.
////        let app = XCUIApplication()
////        app.launch()
////        
////
////        // Use XCTAssert and related functions to verify your tests produce the correct results.
////    }
//    
//    @MainActor
//    func testSchoolListViewModel() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//        
//    }
//    
//    
//
////    @MainActor
////    func testLaunchPerformance() throws {
////        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
////            // This measures how long it takes to launch your application.
////            measure(metrics: [XCTApplicationLaunchMetric()]) {
////                XCUIApplication().launch()
////            }
////        }
////    }
//}

final class AppFlowTests: XCTestCase {
    
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testScrollingAndNavigation() {
        
        let app = XCUIApplication()
        app.navigationBars["NYC Schools"].staticTexts["NYC Schools"].tap()

       
        
        let collectionViewsQuery = app.collectionViews
        app.collectionViews
            .containing(
                .other,
                identifier:"Vertical scroll bar, 7 pages"
            ).element
            .swipeUp()
        collectionViewsQuery.staticTexts["East Side Community School"].tap()
        
    }
}
