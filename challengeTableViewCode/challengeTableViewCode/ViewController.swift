//
//  ViewController.swift
//  challengeTableViewCode
//
//  Created by Lili Cabral on 29/04/22.
//

import UIKit

class ViewController: UIViewController {
        
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        for x in 0...20 {
            data.append("Essa é a linha \(x)")
        }
        
        view.addSubview(tableView)
        
        registerCell()
    }
    
    func registerCell() {
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell tapped")
    }
}
