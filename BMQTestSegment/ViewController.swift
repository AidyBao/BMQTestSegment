//
//  ViewController.swift
//  BMQTestSegment
//
//  Created by 120v on 2017/7/6.
//  Copyright © 2017年 120v. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Test"
        
        let mqSegmentView:MQSegmentView = MQSegmentView.init(frame: CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64))
        mqSegmentView.backgroundColor = UIColor.lightGray
        mqSegmentView.arrTitle = self.titleArr
        mqSegmentView.dataSource = self
        mqSegmentView.delegate = self
        self.view.addSubview(mqSegmentView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: - Lazy
    lazy var titleArr: NSMutableArray = {
        let arr: NSMutableArray = NSMutableArray.init(capacity: 3)
        arr.setArray(["精选", "电视剧电视剧电视剧", "电影", "综艺", "段子", "视屏", "养生"])
        return arr
    }()
}

extension ViewController: MQSegmentViewDataSource {
    func numberOfTab(mqSegmentView: MQSegmentView) -> NSInteger {
        return self.titleArr.count
    }
    
    func slideSwitchView(mqSegmentView: MQSegmentView, index: NSInteger) -> UIViewController {
        let testView = TestViewController.init()
        self.addChildViewController(testView)
        testView.title = self.titleArr.object(at: index) as? String
        return testView
    }
}

extension ViewController: MQSegmentViewDelegate {
    func didselectSegmentView(mqSegmentView: MQSegmentView, index: NSInteger) {
        
    }
}

