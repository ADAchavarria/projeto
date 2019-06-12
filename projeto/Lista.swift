//
//  Lista.swift
//  projeto
//
//  Created by Ricardo on 12/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

class Listas: Codable {
    let listas: [Lista]
    
    init(listas: [Lista]) {
        self.listas = listas
    }
}

class Lista: Codable {
    
    let username: String
    let password: String
    let nome: String
    let morada: String
    let nascimento: String
    let nmrsaude: String
    let tiposangue: String
    let hospital: String
    
    init(username: String, password: String, nome: String, morada: String, nascimento: String, nmrsaude: String, tiposangue: String, hospital: String) {
        self.username = username
        self.password = password
        self.nome = nome
        self.morada = morada
        self.nascimento = nascimento
        self.nmrsaude = nmrsaude
        self.tiposangue = tiposangue
        self.hospital = hospital
    }
    
    
}
