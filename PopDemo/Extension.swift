//
//  Extension.swift
//  PopDemo
//
//  Created by lieon on 2017/3/26.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

import Foundation
import UIKit
/// 定义一个查找可复用cell的extension，这样我们在其他地方的查找cell时，就不用再抓换cell的类型了，直接告诉cell的类型是什么，该方法就自动返回所给cell的类型
extension UITableView {
    /// T: 为swift泛型，泛指任意类型，这里指UITableViewCell类型, T要遵守ViewNameReusable
    func dequeReuseableCell<T: UITableViewCell>( for IndexPath: IndexPath) -> T where T: ViewNameReusable {
         guard let cell = dequeueReusableCell(withIdentifier: T.reuseIndentifier, for: IndexPath) as? T else {    fatalError("Could not dequeue cell with identifier: \(T.reuseIndentifier)") }
        return cell
    }
}

/// FruitCell实现View的协议
extension View where Self: FruitCell {
    func get(data model: Any) {
      if let fruit = model as? FoodModel {
            foodIconImageView.image = UIImage(named: fruit.foodIcon)
            foodDescription.text = fruit.foodDescription
        }
    }
}

/// VegetableCell实现View的协议
extension View where Self: VegetableCell {
    func get(data model: Any) {
        if let fruit = model as? FoodModel {
            foodIconImageView.image = UIImage(named: fruit.foodIcon)
            foodDescription.text = fruit.foodDescription
        }
    }
}
