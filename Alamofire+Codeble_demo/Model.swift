//
//  Model.swift
//  Alamofire+Codeble_demo
//
//  Created by takuyaOhmuro on 2018/08/30.
//  Copyright © 2018年 takuyaOhmuro. All rights reserved.
//

import Foundation
import UIKit

struct Contact: Codable {
    var id : String
    var name : String
    var email : String
    var address : String
    var gender : String
    var phone : Phone
}

struct Phone: Codable {
    var mobile : String
    var home : String
    var office : String
}
