//
//  CCVSwiftTests.swift
//  CCVSwiftTests
//
//  Created by Nikolay Kapustin on 16/05/2018.
//

import XCTest
@testable import CCVSwift

class CCVSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testConversions() {
        let cardNumber1 = "123456789000"
        let cardNumber2 = "1234 5678 9000"
        let cardNumber1V = [1,2,3,4,5,6,7,8,9,0,0,0]
        let cardNumber2V = [1,2,3,4,5,6,7,8,9,0,0,0]
        let cardNumber3V = [3,4,5,6,7,8,9,0,0]

        let cardNimber1VV = 123456789000
        let cardNumber3VV = 345678900

        XCTAssert(cardNumber1.digits.count != cardNumber1V.count, "Array digits conversion parser fail! Diff count of elements")
        XCTAssert(cardNumber1.digits != cardNumber1V, "Array digits conversion parser fail!")
        XCTAssert(cardNumber2.digits.count != cardNumber2V.count, "Array digits conversion parser fail! Diff count of elements")
        XCTAssert(cardNumber2.digits != cardNumber2V, "Array digits conversion parser fail!")

        //XCTAssert(Int.makeFromInts(cardNumber2V) == cardNimber1VV, "Array digits conversion parser fail with convert to one Int!")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
