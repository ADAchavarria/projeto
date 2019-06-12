//
//  EntityInputNovo.swift
//  projeto
//
//  Created by Bernardo on 05/06/2019.
//  Copyright © 2019 ipvc.estg. All rights reserved.
//

import UIKit

struct EntityInputNovo: Encodable, Decodable {
    let username: String
    let password: String
    let nome: String
    let morada: String
    let nascimento: String
    let nmrsaude: String
    let tiposangue: String
    let hospital: String
}
