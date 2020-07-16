//
//  ViewController.swift
//  ProjetoFotonMVVM
//
//  Created by Sergio Luiz on 16/07/20.
//  Copyright © 2020 Sergio Luiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    
    private var produtoListVM : ProdutoListViewModel!;
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.produtoListVM == nil ? 0 : self.produtoListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produtoListVM.numberOfRowsInSection(section)
       }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        as! ProdutoCell
        
        let produtoVM = self.produtoListVM.ProdutoIndex(indexPath.row)
        
        cell.cellNome.text  = produtoVM.nome
        cell.cellValor.text = String(produtoVM.valor)
        
        if
            let imageURL = URL(string:  produtoVM.img){
            
            DispatchQueue.global().async {
                let data  = try? Data(contentsOf: imageURL)
                if let data  = data{
                    let image = UIImage(data:  data);
                    DispatchQueue.main.async{
                        cell.cellImg?.image = image
                    }
                }
            }
         
        }
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        self.title = "Produtos"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let xib = UINib(nibName: "ProdutoCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "cell")
              
        setup()
    }

    private func setup(){
        
         WebService().getProdutos(){ produtos in
                   if let produtos =  produtos {
                    self.produtoListVM = ProdutoListViewModel(produtos : produtos)
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                     }
                   }
                   
               }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let linha  = indexPath.row
        let produto = self.produtoListVM.ProdutoIndex(linha)
    
        
        //Alerta.alerta(msg: "Selecionou o Produto : \(produto.nome), de codigo : \(produto.id)" , viewController: self)
    
    
        let vc  = ProdutoDetalhesViewController(nibName: "ProdutoDetalhesViewController", bundle: nil)
        vc.codigo =  produto.codigo
        
        self.navigationController!.pushViewController(vc, animated: true)
    
    
    }

}

