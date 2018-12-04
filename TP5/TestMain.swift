//
//  TestMain.swift
//  TP5
//
//  Created by ROCHETTE Nicolas on 04/12/2018.
//  Copyright © 2018 ROCHETTE Nicolas. All rights reserved.
//

import Foundation

class TestMain {
    var main = Array<Carte>()
    var bonus: Int32 = 0
    
    init(_ carte1:Carte,_ carte2:Carte,_ carte3:Carte,_ carte4:Carte,_ carte5:Carte){
        
        self.main.append(carte1)
        self.main.append(carte2)
        self.main.append(carte3)
        self.main.append(carte4)
        self.main.append(carte5)
    }
    func verification()->Bool{
        if(pair() || doublePair() || brelan() || suite() || couleur() || full() || carre() || quinte() || quinteFlushRoyal()){
            return true
        }
        else{
            return false
        }
    }
    func pair() -> Bool {
        var paire = 0
        
        for i in 0...4{
            for j in 0...4{
                if(main[i].valeur == main [j].valeur){
                    paire += 1
                }
            }
        }
        if(paire == 7 || paire == 13){
            bonus = 1
            return true
        }
        else{
            return false
        }
    }
    func doublePair()->Bool{
        var Dpaire = 0
        
        for i in 0...4{
            for j in 0...4{
                if(main[i].valeur == main [j].valeur){
                    Dpaire += 1
                }
            }
        }
        if(Dpaire == 9){
            bonus = 2
            return true
        }
        else{
            return false
        }
    }
    func brelan()->Bool{
        var brelan = 0
        for i in 0...4{
            for j in 0...4{
                if(main[i].valeur == main [j].valeur){
                    brelan = brelan + 1
                }
                
            }
        }
        if brelan == 11 || brelan == 13
        {
            bonus = 3
            return true
        }
        else {
            return false
        }
    }
    
    func suite()->Bool{
        main.sort()
        for i in 0...3{
            if(main[i].valeur.rawValue != main[i+1].valeur.rawValue - 1 ){
                return false
            }
        }
        bonus = 4
        return true
    }
    func couleur()->Bool{
        for i in 0...3{
            if(main[i].couleur != main[i+1].couleur)
            {
                return false
            }
        }
        bonus = 5
        return true
    }
    func full()->Bool{
        
        if (self.pair() && self.brelan()){
            self.bonus = 6
            return true
        }
            
        else{
            return false
        }
        
    }
    func carre()->Bool{
        
        var carre = 0
        for i in 0...4{
            for j in 0...4{
                if(main[i].valeur == main [j].valeur){
                    carre = carre + 1
                    
                }
                
            }
        }
        if carre == 17
        {
            bonus = 7
            return true
        }
        else {
            return false
        }
    }
    func quinte()->Bool{
        if(suite() && couleur()){
            bonus = 8
            return true
        }
        return false
    }
    func quinteFlushRoyal()->Bool{
        main.sort()
        if(main[0].valeur.rawValue == 10){
            if(suite() && couleur()){
                bonus = 10
                return true
            }
        }
        return false
    }
}
