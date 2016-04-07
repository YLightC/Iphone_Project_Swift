//
//  Refresh.swift
//  BS
//
//  Created by 姚驷旭 on 16/3/17.
//  Copyright © 2016年 姚驷旭. All rights reserved.
//

import Foundation
import MJRefresh

extension UIViewController {
    func initRefreshHeader(scrollView:UIScrollView?,refreshIngBlock:Void -> Void) {
        scrollView?.mj_header = MJRefreshNormalHeader(refreshingBlock:refreshIngBlock)
    }
}