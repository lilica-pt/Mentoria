//
//  HojeDetalheUnicoVC.swift
//  App Store
//
//  Created by Tiago Oliveira on 05/04/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class HojeDetalheUnicoVC: UITableViewController {
  
  let cellId = "cellId"
  
  var hojeApp: HojeApp?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.backgroundColor = .white
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.register(HojeDetalheUnicoCell.self, forCellReuseIdentifier: cellId)
    
    self.adicionarHeader()
  }
  
  func adicionarHeader () {
    let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))
    
    let hojeCell = HojeCell()
    hojeCell.hojeApp = self.hojeApp
    hojeCell.layer.cornerRadius = 0
    
    headerView.addSubview(hojeCell)
    hojeCell.preencherSuperview()
    
    self.tableView.tableHeaderView = headerView
  }
  
}

extension HojeDetalheUnicoVC {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HojeDetalheUnicoCell
    return cell
  }
}
