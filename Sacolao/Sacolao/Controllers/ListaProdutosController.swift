//
//  ListaProdutosController.swift
//  Sacolao
//
//  Created by padrao on 6/9/16.
//  Copyright © 2016 Alexandre Oliveira. All rights reserved.
//

import UIKit

class ListaProdutosController: UITableViewController {

    var produtos:Array<Produto>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.produtos = try? ProdutoDAO().all()
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (produtos?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let produto = produtos![row]
        let selector = UILongPressGestureRecognizer(target: self, action: Selector("detailProduto:"))
        let cell = UITableViewCell(style: .Subtitle,
                                   reuseIdentifier: nil)
        cell.addGestureRecognizer(selector)
        cell.textLabel?.text = " \(produto.getCodigo()) - \(produto.getNome())"
        cell.detailTextLabel?.text = String(produto.getQuantidade())
        return cell
    }
    
    @IBAction func openAdicionarProduto(sender: UIBarButtonItem) {
        let adicionarProdutoController = self.storyboard?.instantiateViewControllerWithIdentifier("adicionarProdutoSegue")
        self.navigationController!.pushViewController(adicionarProdutoController!, animated: true)
    }
    
    private func detailProduto(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state == UIGestureRecognizerState.Began {
            let ocorrencia = gestureReconizer.view as? UITableViewCell
            let index = tableView.indexPathForCell(ocorrencia!)
            let produto = produtos![(index?.row)!]
            print("Produto: \(produto.getNome())")
        }
    }
}
