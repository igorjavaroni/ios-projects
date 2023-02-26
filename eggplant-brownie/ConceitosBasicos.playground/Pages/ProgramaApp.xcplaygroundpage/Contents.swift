//: [Previous](@previous)

import Foundation

class Refeicao {
    
    // ATRIBUTOS
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    
    // CONSTRUTOR
    init(nome: String, felicidade: String){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func TotalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        return total
    }
}

class Item {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}

let refeicao = Refeicao(nome: "Almoço", felicidade: "4")

let arroz = Item(nome: "Arroz", calorias: 51.0)
let feijão = Item(nome: "Feijão", calorias: 53.45)
let carne = Item(nome: "Carne", calorias: 23.67)

refeicao.itens.append(arroz)
refeicao.itens.append(feijão)
refeicao.itens.append(carne)

print(refeicao.nome)
print(refeicao.felicidade, "\n")

if let primeiroItemRefeicao = refeicao.itens.first {
    print(primeiroItemRefeicao.nome)
}

print(refeicao.TotalDeCalorias())



