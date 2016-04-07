//
//  GetId.swift
//  BS
//
//  Created by 姚驷旭 on 16/3/16.
//  Copyright © 2016年 姚驷旭. All rights reserved.
//

import UIKit


protocol GetIdDelegate {
    func sendId(inout userId :String)
}


class GetId : NSObject {
    
    static var id = ""
    var delegate : GetIdDelegate!
    
    func UserId() {
        print("GetId init()")
        delegate.sendId(&GetId.id)
    }
    
}
