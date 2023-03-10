//
//  AdiconarItensViewController.swift
//  eggplant-brownie
//
//  Created by Igor Javaroni on 14/01/23.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    //    MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    //    MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //    MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    MARK: - IBActions
    
    @IBAction func AdicionarItem(_ sender: Any) {
        //Navegar para a próxima tela: navigationController.push()
        //Voltar para a tela anterior: navigationController.pop()
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else {
            return
        }
        
        if let numeroDeCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            delegate?.add(item)        
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    

}
