//
//  Argent.swift
//  TP5
//
//  Created by HARO Nathan on 27/11/2018.
//  Copyright © 2018 HARO Nathan. All rights reserved.
//

import Cocoa

class Argent {

    var porteFeuille:Int
    var gain:Int {
        if combinaison == 0 {
            return (-self.mise)
        }else{
            return mise * combinaison * bonusTour(tour)
        }
    }
    var mise:Int
    var tour:Int
    var combinaison:Int
    init (_ porteFeuille:Int) {
        self.porteFeuille = porteFeuille
        mise = 0
        tour = 1
        combinaison = 0
    }
    
    func bonusTour(_ tour:Int) -> Int {
        let bonus:Int = 2
        if tour == 1 {
            return bonus
        }else{
            return bonus - 1
        }
    }
    
    func updatePorteFeuille() -> Int {
        self.porteFeuille = self.porteFeuille + gain
        return self.porteFeuille
    }
}
