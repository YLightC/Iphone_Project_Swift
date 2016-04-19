//
//  DidShowViewController.swift
//  BS
//
//  Created by 姚驷旭 on 16/1/18.
//  Copyright © 2016年 姚驷旭. All rights reserved.
//

import UIKit
import FMDB

//已举办

class DidShowViewController: UIViewController {
    
    var activityInfo: [Dictionary<String,String>] = []
    var didActivityInfo: [Dictionary<String,String>] = []
    
    let tableView = UITableView()
    let cellIdentifier = "UserDidiShowTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = LHBackGroundColor()
        initTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initTableView() {
        self.view.addSubview(tableView)
        tableView.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(64)
            make.bottom.equalTo(-64)
            make.left.equalTo(0)
            make.right.equalTo(0)
        })
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        let cellNib = UINib(nibName: "UserDidiShowTableViewCell", bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: cellIdentifier)
        startHeadRefresh(tableView, reloadData: initGetData)
        initGetData()
    }
    
}

extension DidShowViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 15
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView()
        } else {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 15))
            view.backgroundColor = UIColor.clearColor()
            return view
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return didActivityInfo.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UserDidiShowTableViewCell
//        cell.timeLabel.text = "2015-12-25 20:30"
//        cell.addressLabel.text = "首都体育场"
        
        cell.nameLabel.text = didActivityInfo[indexPath.section]["acname"]
        cell.timeLabel.text = didActivityInfo[indexPath.section]["actime"]
        cell.addressLabel.text = didActivityInfo[indexPath.section]["acaddress"]
        cell.titleImage.image = getImage(didActivityInfo[indexPath.section]["accover"]!)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 201
    }
}

extension DidShowViewController {
    func initGetData() {
        showHud()
        activityInfo.removeAll()
        didActivityInfo.removeAll()
        let database = FMDatabase(path: path().path)
        if database.open() {
            do {
                let rs = try database.executeQuery( "select acname, actime, acaddress, accover from activitytable", values: nil)
                while rs.next() {
                    let id = rs.stringForColumn("acname")
                    let pwd = rs.stringForColumn("actime")
                    let status = rs.stringForColumn("acaddress")
                    let cover = rs.stringForColumn("accover")
                    var dic = Dictionary<String,String>()
                    dic["acname"] = id
                    dic["actime"] = pwd
                    dic["acaddress"] = status
                    dic["accover"] = cover
                    activityInfo.append(dic)
                }
            } catch {
                ToastInfo("获取数据失败!")
            }
        } else {
            ToastInfo("获取数据失败!")
        }
        
        database.close()
        popHud()
        let dataFormat = NSDateFormatter()
        dataFormat.dateFormat = "yyyy-MM-dd"
        let starttime = dataFormat.stringFromDate(NSDate())

        activityInfo.forEach({
            if $0["actime"] < starttime {
                print("$0 = \($0)")
                didActivityInfo.append($0)
            }
        })
        stopHeadRefresh(tableView)
        if didActivityInfo.count == 0 {
            ToastInfo("没有已举办过的活动！")
        } else {
            tableView.reloadData()
        }
    }
}

