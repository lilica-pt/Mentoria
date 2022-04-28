//
//  App.swift
//  App Store
//
//  Created by Tiago Oliveira on 15/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

struct App: Decodable {
  let id: Int
  let nome: String
  let empresa: String
  let avalicao: String?
  let iconeUrl: String
  let descricao: String?
  let screenshotUrls: [String]?
  let comentarios: [AppComentario]?
}

struct AppDestaque: Decodable {
  let id: Int
  let nome: String
  let empresa: String
  let imagemUrl: String
  let descricao: String
}

struct AppGrupo: Decodable {
  let id: String
  let titulo: String
  let apps: [App]
}

struct AppComentario: Decodable {
  let id: Int
  let titulo: String
  let avaliacao: Int
  let descricao: String?
}
