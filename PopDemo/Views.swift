//
//  Views.swift
//  PopDemo
//
//  Created by lieon on 2017/3/26.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

import Foundation
import UIKit

/// 定义两个Cell（FruitCell，VegetableCell），分别遵守 View, FoodViewProtocol, ViewNameReusable协议，这样cell就可以调用各个协议中的方法了
class FruitCell: UITableViewCell, View, FoodViewProtocol, ViewNameReusable {
    /// 实现FoodViewProtocol
    @IBOutlet  weak var  foodIconImageView: UIImageView!
    @IBOutlet weak var foodDescription: UILabel!
}

class VegetableCell: UITableViewCell, View, FoodViewProtocol, ViewNameReusable {
    /// 实现FoodViewProtocol
   @IBOutlet weak var  foodIconImageView: UIImageView!
   @IBOutlet weak var foodDescription: UILabel!
}
