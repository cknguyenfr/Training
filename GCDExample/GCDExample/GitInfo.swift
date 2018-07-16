//
//  GitInfo.swift
//  GCDExample
//
//  Created by Can Khac Nguyen on 7/16/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import UIKit
import ObjectMapper

class GitInfo: Mappable {
    var id : Int?
    var name : String?
    var ownerID : Int?
    var description : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        ownerID <- map["owner.id"]
    }
}
