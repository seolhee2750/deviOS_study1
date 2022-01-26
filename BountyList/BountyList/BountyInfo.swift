//
//  BountyInfo.swift
//  BountyList
//
//  Created by 설희pc on 2022/01/26.
//

import UIKit

// Model (데이터)
struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
