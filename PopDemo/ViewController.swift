//
//  ViewController.swift
//  PopDemo
//
//  Created by lieon on 2017/3/25.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate lazy var foods: [FoodType] =  [FoodType]()
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var textField0: UITextField!
    @IBOutlet fileprivate weak var textField1: UITextField!
    @IBOutlet fileprivate weak var resultLabel: UILabel!
    
    @IBAction func addAction(_ sender: Any) {
        /// 调用协议中的caculate方法
        resultLabel.text = String(caculate())
    }
    
    @IBAction func reloadFoodAction(_ sender: Any) {
        generateFoods()
        tableView.reloadData()
    }
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        tableView.dataSource = self
        
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// 从数据Enumbox中取值，枚举里面包含了模型数据
        switch foods[indexPath.row] {
        case .fruit(let apple):
            /// 直接给出cell的类型，那么 dequeReuseableCell就会自动返回该类型的cell了，这样就不用guard去转换了
            let cell: FruitCell = tableView.dequeReuseableCell(for: indexPath)
            /// 调用View这个协议中的 func get(data model: Any) 方法，用于给cell赋值数据
            cell.get(data: apple)
            return cell
        case .vegetable(let sala):
             let cell: VegetableCell = tableView.dequeReuseableCell(for: indexPath)
            cell.get(data: sala)
              return cell
        }
    }
}
 /// 实现Caculator协议
extension ViewController: Caculator {
    var foo0: Int {
        if let text = textField0.text, let foo0 = Int(text) {
            return foo0
        }
        return 0
    }
    
    var foo1: Int {
        if let text = textField1.text, let foo1 = Int(text) {
            return foo1
        }
        return 0
    }
}

extension ViewController {
    /// 在真实开发中 数据从服务器获取，需要我们手动识别数据，
    fileprivate  func generateFoods() {
        let apple = FoodModel(desc: "I am apple", iconname: "Apple")
        let salad = FoodModel(desc: "I am salad", iconname: "Salad")
        for _ in 0 ... 5 {
            let fruitType = FoodType.fruit(apple)
            let vegeType = FoodType.vegetable(salad)
            foods.append(fruitType)
            foods.append(vegeType)
        }
    }
}

