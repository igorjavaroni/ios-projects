//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Igor Javaroni on 13/12/22.
//

import UIKit
protocol AdicionaRefeicaoDelegate {
    func add(_ refeicaoAdd: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource,
                      UITableViewDelegate, AdicionaItensDelegate{
    
    //MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
//    var itens: [String] = ["Molho de tomate", "Queijo", "Molho de pimenta", "Manjericão"]
    
    var itens: [Item] = []
    var itensSelecionados : [Item] = []
    
    //MARK: - IBOutlets
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() { //Quando a view acabou de ser carregada
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(AdicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        recuperaItens()
    }
    
    func recuperaItens(){
        itens = ItemDAO().recupera()
    }
    
    @objc func AdicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self);        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        ItemDAO().save(itens)
        if let tableView = itensTableView {
            tableView.reloadData ()
        } else {
            Alerta(controller: self).exibe(titulo: "Desculpe", mensagem: "Não foi possível atualizar a tabela")
        } 
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    //MARK: = UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none{
            
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
            
        } else {
            
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
                
                for itemSelecionado in itensSelecionados{
                    print(itemSelecionado.nome)
                }
            }
        }
    }
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            Alerta(controller: self).exibe(mensagem: "Favor preencher campo nome")
            return nil
        }

        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            Alerta(controller: self).exibe(mensagem: "Favor preencher campo felicidade")
            return nil
        }

        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    //MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        if let refeicao = recuperaRefeicaoDoFormulario(){
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        }
        else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler os dados do formulário")
        }
    }
}

