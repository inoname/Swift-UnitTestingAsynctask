//
//  UnitTesting_Asynctask_DemoTests.swift
//  UnitTesting-Asynctask-DemoTests
//
//  Created by kouliang on 15/3/4.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

import UIKit
import XCTest

class UnitTesting_Asynctask_DemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testNetWork() {
        // 1. 定义一个"期望" -> 描述异步的需求，只是一个标记而已
        let expectation = expectationWithDescription("netWorkIsOK")
        
        let vc = ViewController()
        vc.netWorkTask { (str) -> () in
            println(str+"---\(NSThread.currentThread())")
            
            // 2. 标记"期望达成"
            expectation.fulfill()
        }
        
        // 3. 等待期望达成
        // 参数时间：等待异步操作必须在10s钟之内完成
        waitForExpectationsWithTimeout(2.0, handler: { (error) -> Void in
            XCTAssertNil(error)
        })
    }
    
}
