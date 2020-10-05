//
//  locationStruct.swift
//  xib_ViewController_example
//
//  Created by Charles Hopman on 9/28/20.
//  Copyright © 2020 Charles Hopman. All rights reserved.
//

import UIKit

struct country: Codable {
    var title, location_type: String
    var woeid: Int
    var latt_long: String
    var img:String?
    enum CodingKeys: String, CodingKey {
        case title, location_type, woeid, latt_long, img
    }
}
