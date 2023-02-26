//: [Previous](@previous)

import Foundation

class prato {
    var nome: String?
    var felicidade: String?
}

//instanciando uma classe

let refeicao = prato()
refeicao.nome = "Miojo"

// Formas de extrair valores do text Optionals()

// Forma 1
if refeicao.nome != nil {
    print("Forma 1")
    print(refeicao.nome!, "\n")
}

// Forma 2
if let nome = refeicao.nome {
    print("Forma 2")
    print(nome, "\n")
}

// Forma 3(RECOMENDADO) - Obs: Nesta forma a variável nome será usada somente dentro do if let
func exibeNomeDaRefeicao (){
    if let nome = refeicao.nome {
        print("Forma 3")
        print(nome, "\n")
    }

// Forma 4(RECOMENDADO) - Esta forma é igual a Forma 3, porém a variável nome pode ser usada até o fim do método
    guard let nome = refeicao.nome else {
        // Aqui pode ser escrito ainda algum código
        return
    }
    print("Forma 4")
    print(nome,"\n")
}

exibeNomeDaRefeicao()

let numero = Int("5")
print(numero)
