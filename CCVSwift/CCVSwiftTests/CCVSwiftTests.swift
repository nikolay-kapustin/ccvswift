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

    func testLuhn() {
        let validCardStrings = ["4444444444446666", "4111111111111111", "4563960122001999", "5555555555555557", "5555555555555599",
                                "639002000000000003", "4444444444444422", "4444444411111111", "4444444499999999"]
        for cardStr in validCardStrings {
            XCTAssert(CCVCard.isLuhnValid(cardStr), "Luhna test card failed! - \(cardStr)")
        }

    }
    func testCardTypes(){
        let validCards = [CCVBankigCardType.MasterCard:"5234098390084432",
                          CCVBankigCardType.Dankort:"5019988087668732",
                          CCVBankigCardType.Maestro: "5763788390348990",
                          CCVBankigCardType.Mir: "2203766321873455"
                          ]

        for (typeCard, cardNum) in validCards {
            let type = CCVCard.detectTypeCard(cardNum)
            //print("Card \(typeCard.rawValue) = \(cardNum) is detected as \(type.rawValue)")
            XCTAssert(type.rawValue == typeCard.rawValue, "Test card type failed for type \(typeCard)")
        }

    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
