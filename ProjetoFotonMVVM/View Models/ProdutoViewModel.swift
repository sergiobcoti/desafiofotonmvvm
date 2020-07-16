//
//  ProdutoViewModel.swift
//  ProjetoFotonMVVM
//
//  Created by Sergio Luiz on 16/07/20.
//  Copyright © 2020 Sergio Luiz. All rights reserved.
//

import Foundation

struct ProdutoListViewModel{
    let produtos : [Produto]
    
}


extension ProdutoListViewModel{
    
    var numberOfSections :  Int{
        return 1
    }
    
    func numberOfRowsInSection( _ section :  Int) -> Int{
        return produtos.count
    }
    
    func ProdutoIndex( _ index : Int) -> ProdutoViewModel{
        let produto = self.produtos[index]
        return ProdutoViewModel(produto)
        
    }
}


struct ProdutoViewModel{
    private let produto : Produto
    
}

extension ProdutoViewModel{
    init(_ produto :  Produto){
        self.produto = produto
    }
    
}

extension ProdutoViewModel{
    
    var codigo : Int {
        return self.produto.codigo
      }
  
    var nome : String {
         return self.produto.nome
       }
    
    var descricao : String {
         return self.produto.descricao
       }
    
    var valor : Double {
         return self.produto.valor
       }

    var quantidade : Int {
           return self.produto.quantidade
         }

    var img : String {
      return self.produto.img
    }

    
    
}
