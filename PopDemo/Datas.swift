//
//  Datas.swift
//  PopDemo
//
//  Created by lieon on 2017/3/26.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

import Foundation
/// 数据模型
class FoodModel: NSObject {
    var foodDescription: String = ""
    var foodIcon: String = ""
    
    convenience init(desc: String, iconname: String) {
        self.init()
        self.foodDescription = desc
        self.foodIcon = iconname
    }
}

/// 数据的类型模型EnumBox, Swift 的枚举很强大
enum FoodType {
    case fruit(FoodModel)
    case vegetable(FoodModel)
}
