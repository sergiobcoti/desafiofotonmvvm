//
//  Produto.swift
//  ProjetoFotonMVVM
//
//  Created by Sergio Luiz on 16/07/20.
//  Copyright © 2020 Sergio Luiz. All rights reserved.
//

import Foundation

struct Produto :  Decodable{
    
    let codigo: Int
    let nome : String
    let valor :  Double
    let img :  String
    let descricao :  String
    let quantidade :  Int
    
    
}

