//
//  BuscaService.swift
//  App Store
//
//  Created by Tiago Oliveira on 15/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class BuscaService {
  
  static let shared = BuscaService()
  
  func buscaApps (texto: String, completion: @escaping ([App]?, Error?) -> ()) {
    
    guard let url = URL(string: "https://api.euprogramador.app/app-store/v1/apps?search=\(texto)") else {return}
    
    URLSession.shared.dataTask(with: url) { (data, res, err) in
      if let err = err {
        completion(nil, err)
        return
      }      
      do {
        guard let data = data else {return}
        let apps = try JSONDecoder().decode([App].self, from: data)
        completion(apps, nil)
      } catch let err {
        completion(nil, err)
        return
      }
    }.resume()
  }
  
}
