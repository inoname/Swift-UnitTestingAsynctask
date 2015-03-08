//
//  ViewController.swift
//  UnitTesting-Asynctask-Demo
//
//  Created by kouliang on 15/3/4.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    // 定义闭包类型， 注意类型别名的首字母要大写
    typealias Completion = (str:String)->()
    func netWorkTask(completion:Completion) {
        
        // 耗时操作在后台执行
        // 尾随闭包
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            println("努力工作中---\(NSThread.currentThread())")
            NSThread.sleepForTimeInterval(3.0)
            
            let jsonData="返回的数据"
            dispatch_async(dispatch_get_main_queue()) {
                completion(str: jsonData)
            }
        }
    }

}

