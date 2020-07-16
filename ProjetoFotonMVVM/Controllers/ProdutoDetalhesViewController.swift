//
//  ProdutoDetalhesViewController.swift
//  ProjetoFotonMVVM
//
//  Created by Sergio Luiz on 16/07/20.
//  Copyright © 2020 Sergio Luiz. All rights reserved.
//

import Foundation

import UIKit

class ProdutoDetalhesViewController : UIViewController{
    
    @IBOutlet weak var lblquantidade: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lblNome: UILabel!
    
    @IBOutlet weak var lblValor: UILabel!
    
    @IBOutlet weak var lblqtd: UITextField!
    
    @IBOutlet weak var lblDescricao: UILabel!
    
    private var produtoVM  : ProdutoViewModel!
    var codigo: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalhes produto"
        self.lblqtd.text = "0";
        self.setup()
       
    }
    
    
    @IBAction func removerQTD(_ sender: Any) {
        let campo  = Int(lblqtd.text!)!;
              var qtd  : Int  =  campo
              if(qtd == 0){
                  return
              }
              qtd = qtd  - 1
              print(qtd)
              self.lblqtd.text = String(qtd)
    }
    
    @IBAction func AdicionarQTD(_ sender: Any) {
        let campo  = Int(lblqtd.text!)!;
             var qtd  : Int  =  campo
             qtd = qtd + 1
             print(qtd)

             self.lblqtd.text = String(qtd)
    }
    
    @IBAction func efetuarCompra(_ sender: Any) {
        
        guard let campo = self.lblqtd.text, !campo.isEmpty else {
            return
        }
        
        if (Int(campo)! <= 0){
            Alerta.alerta(msg: "Compra não aceita, por favor selecione uma quantidade", viewController:
                self)
        }else if(Int(campo)! > self.produtoVM.quantidade){
            Alerta.alerta(msg: "Quantidade de produtos excedidas!",
            viewController: self)
            
            
        }else{
            Alerta.alerta(msg: "Compra efetuada com sucesso.", viewController: self)
        }
    }
    
    

    
    private func setup(){
        
        WebService().getProduto(codigo :  self.codigo!){ produto in
                   if let produto =  produto {
                    self.produtoVM = ProdutoViewModel(produto)
                    DispatchQueue.main.async{
                       self.fillViewControllerProduto()
                        
                     }
                   }
                   
               }
    }
       
    
    func fillViewControllerProduto(){
     
        print(produtoVM.descricao)
        
        self.lblValor.text =  String(produtoVM.valor)
        self.lblqtd.text = String(produtoVM.quantidade)
        self.lblNome.text  = produtoVM.nome
        self.lblDescricao.text = produtoVM.descricao
        self.lblquantidade.text = String(produtoVM.quantidade)
        
        if
        let imageURL = URL(string:  produtoVM.img){
               
               DispatchQueue.global().async {
                   let data  = try? Data(contentsOf: imageURL)
                   if let data  = data{
                       let image = UIImage(data:  data);
                       DispatchQueue.main.async{
                        self.img.image = image
                       }
                   }
               }
            
           }
    }

}

