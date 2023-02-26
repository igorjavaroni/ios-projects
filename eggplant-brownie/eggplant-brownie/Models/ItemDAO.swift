//
//  ItemDAO.swift
//  eggplant-brownie
//
//  Created by Igor Javaroni on 25/02/23.
//

import Foundation

class ItemDAO {
    
    func recuperaCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appending(path: "itens")
        
        return caminho
    }
    
    func recupera() -> [Item] {
        do
        {
            guard let diretorio = recuperaCaminho() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item>
            
            return itensSalvos
        } catch{
            print(error.localizedDescription)
            return []
        }
    }
    
    func save(_ listaDeItens: [Item]){
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: listaDeItens , requiringSecureCoding: false)
            guard let caminho = recuperaCaminho() else { return }
            try data.write(to: caminho )
        }catch {
            print(error.localizedDescription)
            
        }
    }
}
