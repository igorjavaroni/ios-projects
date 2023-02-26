//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Igor Javaroni on 23/12/22.
//

import UIKit

class Refeicao: NSObject, NSCoding {
       
    // MARK: - ATRIBUTOS
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    // MARK: - CONSTRUTOR(Init)
    init(nome: String, felicidade: Int, itens: [Item] = []){
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    // MARK: - Metodos
    func TotalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        return total
    }
    
    func detalhes () -> String {
        var mensagem = "Refeicão: \(nome)"
        
        for item in itens{
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
    
}
