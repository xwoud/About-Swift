//
//  ViewController.swift
//  MenuItemApp
//
//  Created by Hailey on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    let fruitArrays: [String] = ["사과", "배", "포도", "복숭아", "파인애플", "망고"]
    lazy var fruitTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(FruitCell.self,
                           forCellReuseIdentifier: FruitCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FruitCell.identifier) as? FruitCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = fruitArrays[indexPath.row]
        return cell
    }
}

