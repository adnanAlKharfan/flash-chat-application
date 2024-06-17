//
//  Message.swift
//  Flash Chat iOS13
//
//  Created by adnan alkharfan on 14/07/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct message{
    var sender:String
   public var body:String
    var id:String
    
    init(sender s:String,body b:String,_ d:String) {
        sender=s
        body=b
        id=d
    }
    
}
