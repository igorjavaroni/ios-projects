//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Igor Javaroni on 07/01/23.
//

import Foundation
import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes: [Refeicao]  = []
    
    override func viewDidLoad() {
        refeicoes = RefeicaoDAO().recupera()
    }
    
    //Conta quantas linhas serão necessárias na tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    //adiciona o conteúdo dentro das células na tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let LongPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(LongPress)
        
        return celula
    }
    
    func add(_ refeicaoAdd: Refeicao){
        refeicoes.append(refeicaoAdd)
        tableView.reloadData()
        RefeicaoDAO().save( refeicoes )
    }
    
    @objc func mostrarDetalhes (_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: {alert in self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()})
        }
    }

    
    //Prepara antes de seguir para o próximo viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
    }
}
