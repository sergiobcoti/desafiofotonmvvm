//
//  WebService.swift
//  ProjetoFotonMVVM
//
//  Created by Sergio Luiz on 16/07/20.
//  Copyright © 2020 Sergio Luiz. All rights reserved.
//

import Foundation

class WebService{
    
    private var urlString :  String = "https://doacao-tcc.herokuapp.com/produtos/";
    
    func getProdutos(completion:  @escaping([Produto]?) -> ()){
        let url = URL(string :  urlString)
        
        URLSession.shared.dataTask(with: url!){
                  data , response, error in
                  
                  if let error = error {
                      print(error.localizedDescription)
                      completion(nil)
                  }else if let data = data {
                      
                    let produtos = try? JSONDecoder ().decode([Produto].self, from:data)
                   
                      if let produtos = produtos{
                          completion(produtos)
                      }
                      
                      
                      
                  }
                  
                     
              }.resume()
             
        
        
    }
    
    func getProduto(codigo : Int, completion:  @escaping(Produto?) -> ()){
           let url = URL(string :  urlString + String(codigo))
        
        URLSession.shared.dataTask(with: url!){
            data , response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
              let produto = try? JSONDecoder ().decode(Produto.self, from:data)
             
                if let produto = produto{
                    completion(produto)
                }
                
                
                
            }
            
               
        }.resume()
        
    }
}
