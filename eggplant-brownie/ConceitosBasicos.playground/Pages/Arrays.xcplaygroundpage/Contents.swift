//: [Previous](@previous)

import Foundation


let caloria1 = 50.1
let caloria2 = 100
let caloria3 = 300
let caloria4 = 500

//let totalDeCalorias = [50.5, 100, 300, 500, 450]
//print(totalDeCalorias)
////
//// primeira forma de escrever um for
//
//for i in 0...3 {
//    print(i)
//    print(totalDeCalorias[i])
//}
//
//
//// Segunda forma de escrever um for
//
//for i in 0...totalDeCalorias.count-1 {
//    print([i])
//    print(totalDeCalorias[i])
//}
//
//// Terceira forma de escrever for:
//
//// for in
//for caloria in totalDeCalorias {
//    print(caloria)
//}

func todasCalorias(totalDeCalorias : [Double]) -> Double {
    var total: Double = 0
    
    for caloria in totalDeCalorias {
        total += caloria
    }
    
    return total
}

let total = todasCalorias(totalDeCalorias: [50.5, 300])

print(total)


var notas = [9, 6.5, 4, 8.25]
var soma = 0
for nota in notas {
  soma += nota
}
print(soma / notas.count)
