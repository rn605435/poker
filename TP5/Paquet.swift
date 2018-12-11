//
//  Paquet.swift
//  Cartes
//
//  Created by ROCHETTE Nicolas on 13/11/2018.
//  Copyright © 2018 ROCHETTE Nicolas. All rights reserved.
//

import Foundation

class Paquet : CustomStringConvertible {
    var description: String = ""
    
    var cartes : Array<Carte>
    var nombre : Int { get {return cartes.count}}
    var estVide : Bool {get {return cartes.isEmpty} }
    var dessus: Carte? {get {return cartes.first} }
    static var jeuComplet: Paquet {
        get {
            let p = Paquet()
            for c : Carte in "2♣"..."A♠" {
                p.ajouteDessus(c)
            }
            return p
        }
    }
    
    init() {
        self.cartes = Array<Carte>();
        for carte: Carte in self.cartes{
            self.description += carte.description+" "
        }
    }
    func ajouteDessus(_ c: Carte){
        cartes.insert( c , at: cartes.startIndex)
        description = description+c.description + " "
    }
    func enleveDessus() -> Carte?{
        let carteTop: Carte = cartes[0]
        cartes.remove(at: 0)
        return carteTop
    }
    func ajouteDessous(_ p: Paquet){
        for c: Carte in p.cartes {
            cartes.append(c)
        }
    }
    func melange()
    {
        for _ in 0..<10
        {
            cartes.sort { (_,_) in arc4random() < arc4random() }
        }
    }
    
    subscript (index : Int) -> Carte{
        return cartes[index]
    }
}
