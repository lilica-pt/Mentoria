//
//  BaseTabBarVC.swift
//  App Store
//
//  Created by Tiago Oliveira on 09/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class BaseTabBarVC: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let hojeVC  = self.criarTabItem(viewController: HojeVC(), titulo: "Hoje", imagem: "icone-hoje")
    let appsVC  = self.criarTabItem(viewController: AppsVC(), titulo: "Apps", imagem: "icone-apps")
    let buscaVC = self.criarTabItem(viewController: BuscaVC(), titulo: "Busca", imagem: "icone-busca")
    
    viewControllers = [
      hojeVC,
      appsVC,
      buscaVC
    ]
    
    selectedIndex = 0
  }
  
  func criarTabItem (viewController: UIViewController, titulo: String, imagem: String) -> UIViewController {
    let navController = UINavigationController(rootViewController: viewController)
    navController.navigationBar.prefersLargeTitles = true
    
    viewController.navigationItem.title = titulo
    viewController.tabBarItem.title = titulo
    viewController.tabBarItem.image = UIImage(named: imagem)
    viewController.view.backgroundColor = .white
    
    return navController
  }
  
}
