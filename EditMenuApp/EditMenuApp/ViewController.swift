//
//  ViewController.swift
//  MenuItemApp
//
//  Created by Minnit on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    private let fruitArrays: [String] = ["사과", "배", "포도", "복숭아", "파인애플", "망고"]
    private lazy var fruitTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(FruitCell.self,
                           forCellReuseIdentifier: "FruitCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewLayout()
    }
    
    // MARK: Layout
    private func setupTableViewLayout() {
        view.addSubview(fruitTableView)
        NSLayoutConstraint.activate([
            fruitTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            fruitTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fruitTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fruitTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitArrays.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FruitCell.identifier) as? FruitCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setupFruitName(name: fruitArrays[indexPath.row])
        return cell
    }
}
