//
//  UsableData.swift
//  RedSoTest
//
//  Created by Jimmy on 2020/11/18.
//

import UIKit
//MARK: - Convert Results Data to Usable Data
struct UsableData: Decodable {
    var type: String
    var bannerImage: Data?
    var id, name, position: String?
    var expertise: String?
    var avatarImage: Data?
    
}
