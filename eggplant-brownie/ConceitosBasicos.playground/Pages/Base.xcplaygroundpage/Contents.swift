import UIKit

// var = para declarar variáveis(mudam de valor)
// let = para declarar constante(não mudam de valor)

/* comentários
 com mais de
 uma linha! */

let nome: String = "Churros"

let felicidade: Int = 5

let calorias: Double = 13.5

let vegetal: Bool = true


func AlimentoConsumido() {
    print("O alimento consumido foi: \(nome)")
}

//AlimentoConsumido()

func AlimentoCosnumidoPar(_ nome: String,_ caloria: Double){
    print("O alimento consumido foi \(nome) com calorias \(caloria) kcal")
}


AlimentoCosnumidoPar(nome, calorias)

