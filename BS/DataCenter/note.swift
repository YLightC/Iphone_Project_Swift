//
//  note.swift
//  BS
//
//  Created by 姚驷旭 on 16/3/16.
//  Copyright © 2016年 姚驷旭. All rights reserved.
//

import Foundation


/*
    三张表
    登录表
        帐号(string)Primary Key  密码(string)  是否是管理员(string) 0为一般用户 1管理员
    usertable(id text primary key, psw text, status text)
    员工信息表
        帐号(string)Primary Key 姓名(string) 性别(string) 电话(string)  住址(string) 头像(string)
    try database.executeUpdate("create table userinfo(id text primary key, name text, sex text, phone text, address text, headphoto text)", values: nil)
    请假记录表
        帐号(string)Primary Key 姓名(string) 开始时间(string) 结束时间(string) 总天数(string) 类型(string)  原因(string)  照片(string) 状态(string) 0未审核 1审核通过 2审核未通过
//                try database.executeUpdate("create table leavetable(id text primary key, name text, starttime text, endtime text, numberDays text, type text, typeInfo text, photo text, status text)", values: nil)

*/