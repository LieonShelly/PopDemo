//
//  Protocol.swift
//  PopDemo
//
//  Created by lieon on 2017/3/25.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

import Foundation
import UIKit

/// 定义一个位计算器的协议
protocol Caculator {
    var foo0: Int { get }
    var foo1: Int { get }
    
    func caculate() -> Int
}

extension Caculator {
    /// 给协议一个默认的实现(默认的实现为加法)
    func caculate() -> Int {
        return foo0 + foo1
    }
}

/// 定义了view协议用于给UI赋值
protocol View {
   func get(data model: Any)
}

/// 定义ViewNameReusable协议用于view的类名
protocol ViewNameReusable { }
extension ViewNameReusable where Self: UIView {
    /// swift可以在协议的扩展中定义静态属性
    static var reuseIndentifier: String {
        return String(describing: self)
    }
}

/// 定义FoodViewProtocol规定cell里面控件的类型，只要有UIImageView和UILabel都可以使用该协议，这样有利于UI的复用性提高
protocol FoodViewProtocol {
    weak var  foodIconImageView: UIImageView! {get set}
     weak var foodDescription: UILabel! {get set}
}
