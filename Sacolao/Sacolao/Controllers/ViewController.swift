//
//  ViewController.swift
//  Sacolao
//
//  Created by padrao on 6/9/16.
//  Copyright © 2016 Alexandre Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var produto: UITextField!
    @IBOutlet weak var quantidade: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addProduto(sender: UIButton) {
        
        if !isValidDecimalNumber(quantidade.text!) {
            let errorAlert = UIAlertController(title: "Error!",
                                               message: "Número inválido",
                                               preferredStyle: .Alert)
            let okAlertAction = UIAlertAction(title: "Ok",
                                              style: .Default,
                                              handler: nil)
            errorAlert.addAction(okAlertAction)
            self.presentViewController(errorAlert,
                                       animated: true,
                                       completion: nil)
            return
        }
        
        let model = Produto(codigo: nil,
                            nome: produto.text!,
                            quantidade: NSString(string: quantidade.text!).doubleValue)
        do {
            try ProdutoDAO().insert(model)
            voltar()
        } catch {
            let errorAlert = UIAlertController(title: "Error!",
                                               message: "Erro ao salvar o produto \(error)",
                                               preferredStyle: .Alert)
            let okAlertAction = UIAlertAction(title: "Ok",
                                              style: .Cancel,
                                              handler: { (alert: UIAlertAction!) in self.voltar() })
            errorAlert.addAction(okAlertAction)
            self.presentViewController(errorAlert,
                                       animated: true,
                                       completion: nil)
        }
    }
    
    private func isValidDecimalNumber(number: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "\\d+(\\.\\d{1,2})$",
                                                options: .AllowCommentsAndWhitespace)
            let matches = regex.matchesInString(number,
                                                options: .Anchored,
                                                range: NSRange(location: 0, length: number.characters.count))
            return matches.count > 0;
        } catch {
            return false
        }
    }
    
    private func voltar() {
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }

}

