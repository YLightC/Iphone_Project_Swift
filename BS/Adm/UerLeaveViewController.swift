//
//  UerLeaveViewController.swift
//  BS
//
//  Created by 姚驷旭 on 16/3/18.
//  Copyright © 2016年 姚驷旭. All rights reserved.
//

import UIKit

class UerLeaveViewController: UIViewController {

    var userLeave = Dictionary<String,String>()
    let typeLabel = UILabel(frame: CGRect())
    let typeInfo = UITextField(frame: CGRect())
    let image = UIImageView(frame: CGRect())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "请假详情"
        self.automaticallyAdjustsScrollViewInsets = false
        self.tabBarController?.tabBar.hidden = true
        initUi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    func initUi() {
        initTypeLabel()
        initTypeInfo()
        initImage()
    }
    
    func initTypeLabel() {
        typeLabel.text = "请假原因:"
        typeLabel.font = LHFont(20)
        self.view.addSubview(typeLabel)
        typeLabel.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(74)
            make.left.equalTo(20)
        })
    }
    
    func initTypeInfo() {
        typeInfo.font = LHFont(15)
        typeInfo.text = userLeave["typeInfo"]
        typeInfo.enabled = false
        self.view.addSubview(typeInfo)
        typeInfo.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(typeLabel.snp_bottom).offset(10)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(50)
        })
        typeInfo.layer.borderWidth = 0.5
        typeInfo.layer.borderColor = UIColor.orangeColor().CGColor
    }
    
    func initImage() {
        self.view.addSubview(image)
        image.clipsToBounds = true
        image.contentMode = .ScaleAspectFill
        image.image = getImage(userLeave["photo"]!)
        image.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(typeInfo.snp_bottom).offset(10)
            make.left.equalTo(30)
            make.right.equalTo(-20)
            make.bottom.equalTo(-30)
        })
    }
    
}
