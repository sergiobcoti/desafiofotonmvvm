//
//  Alerta.swift
//  ProjetoFotonMVVM
//
//  Created by Sergio Luiz on 16/07/20.
//  Copyright © 2020 Sergio Luiz. All rights reserved.
//


import Foundation
import WebKit

class Alerta{
    
    class func alerta(msg :  String, viewController : UIViewController){
        
        let alert  = UIAlertController(title: "Alerta", message: msg, preferredStyle:
            UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
     
        viewController.present(alert,animated: true, completion: nil)
    }
    
}
