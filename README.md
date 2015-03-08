# Swift-UnitTestingAsynctask
Swift实现异步任务的单元测试
##在 Xcode 6.0 之前实现异步功能的单元测试很困难

---
###现在通过expectation可以很容易实现异步功能的单元测试

```
// 1. 定义一个"期望" -> 描述异步的需求，只是一个标记而已
let expectation = expectationWithDescription("xxxTask")
        
// 2. 在异步任务完成后，通过一下方式标记"期望达成"
//expectation.fulfill()
 
// 3. 等待期望达成
// 参数时间：等待异步操作必须在3s钟之内完成
waitForExpectationsWithTimeout(3.0, handler: { (error) -> Void in
            XCTAssertNil(error)
        })

```
