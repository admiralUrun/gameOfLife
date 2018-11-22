//
//  gameOfLifeTests.swift
//  gameOfLifeTests
//
//  Created by Andrew Yakovenko on 11/4/18.
//  Copyright © 2018 Andrew Yakovenko. All rights reserved.
//

import XCTest
@testable import gameOfLife

class gameOfLifeTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
       
    }

    func testNewLife() {
       let life = Life()
        
        life.createNewLifeAt(x: 2, y: 2)
        
        XCTAssertTrue(life.cellAt(x: 2, y: 2) == .Alive)
    }
    
    func testWillBeDeadAlone() {
        let life = Life()
        
        life.createNewLifeAt(x: 2, y: 2)
        
        life.cycle()
        
        XCTAssertTrue(life.cellAt(x: 2, y: 2) == .Empty)
    }
    
    func testNewLifeBegin() {
        let life = Life()
        
        life.createNewLifeAt(x: 2, y: 3)
        life.createNewLifeAt(x: 3, y: 3)
        life.createNewLifeAt(x: 4, y: 3)
        
        life.cycle()
        
        XCTAssertTrue(life.cellAt(x: 3, y: 2) == .Alive)
        XCTAssertTrue(life.cellAt(x: 3, y: 4) == .Alive)
    }
    
    func testOldLifedie(){
        let life = Life()
        
        life.createNewLifeAt(x: 3, y: 3)
        life.createNewLifeAt(x: 2, y: 3)
        life.createNewLifeAt(x: 4, y: 3)
        
        life.cycle()
        life.cycle()
        
        
        XCTAssertFalse(life.cellAt(x: 2, y: 3) == .Empty)
        XCTAssertFalse(life.cellAt(x: 4, y: 3) == .Empty)
        
    }
    func testStealAlive() {
        let life = Life()
        
        life.createNewLifeAt(x: 3, y: 3)
        life.createNewLifeAt(x: 2, y: 3)
        life.createNewLifeAt(x: 4, y: 3)
        
         life.cycle()
        life.cycle()
        
        
        XCTAssertTrue(life.cellAt(x: 3, y: 3) == .Alive)
        
    }
    func testIsEmpty() {
        let life = Life()
        
        life.createNewLifeAt(x: 3, y: 3)
        life.createNewLifeAt(x: 2, y: 3)
        life.createNewLifeAt(x: 4, y: 3)
        
        life.cycle()
        
        XCTAssertTrue(life.cellAt(x: 2, y: 2) == .Empty)
        XCTAssertTrue(life.cellAt(x: 4, y: 2) == .Empty)
        
        XCTAssertTrue(life.cellAt(x: 2, y: 4) == .Empty)
        XCTAssertTrue(life.cellAt(x: 4, y: 4) == .Empty)
        
        life.cycle()
        
        XCTAssertTrue(life.cellAt(x: 2, y: 2) == .Empty)
        XCTAssertTrue(life.cellAt(x: 4, y: 2) == .Empty)
        
        XCTAssertTrue(life.cellAt(x: 2, y: 4) == .Empty)
        XCTAssertTrue(life.cellAt(x: 4, y: 4) == .Empty)
        
    }
    
    
/*    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
*/
    
    
    
    
    
}
