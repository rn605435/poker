//
//  TapisValues.swift
//  TP5
//
//  Created by ROCHETTE Nicolas on 27/11/2018.
//  Copyright © 2018 ROCHETTE Nicolas. All rights reserved.
//

import Foundation

public class TestTapis {
    
    var tabValeur = Array<Int>()
    var tabCouleur = Array<Int>()
    
    func isPaire(tab : Array<Int>) ->Bool {
        
        var paire = false
        
        for i in 0...3{
            print(tab.description)
            if tab[i] == tab[i+1] {
                paire = true
            }
            
        }
        for i in 0...2{
            if tab[i] == tab[i+2] {
                paire = true
            }
        }
        for i in 0...1{
            if tab[i] == tab[i+3] {
                paire = true
            }
        }
        if tab[0] == tab[4] {
            paire = true
        }
        
        if paire {
            
            return true
        }
        else{
            
            return false
        }
        
    }
    
    func isDoublePaire(tab : Array<Int>) ->Bool {
        
        var doublePaire = false
        
        if tab[0] == tab[1] && tab[2] == tab[3] {
            
            doublePaire = true
            
        }
        else if tab[1] == tab[2] && tab[3] == tab[4]{
            
            doublePaire = true
        }
        else if tab[0] == tab[1] && tab[3] == tab[4]{
            
            doublePaire = true
        }
        else if tab[0] == tab[1] && tab[2] == tab[4]{
            
            doublePaire = true
        }
        
        if doublePaire{
            
            return true
        }
        else{
            
            return false
        }
    }
    
    func isBrelan(tab : Array<Int>) ->Bool {
        
        var brelan = false
        
        for i in 0...2{
            print(tab.description)
            if tab[i] == tab[i+1] && tab[i] == tab[i+2] {
                brelan = true
            }
        }
        for i in 0...1{
            if tab[i] == tab[i+2] && tab[i] == tab[i+3] || tab[i] == tab[i+1] && tab[i] == tab[i+3]{
                brelan = true
            }
        }
        if tab[0] == tab[4] && tab[0] == tab[3] {
            brelan = true
        }
        
        if brelan {
            
            return true
        }
        else{
            
            return false
        }
        
    }
    
    func isCarre(tab : Array<Int>) ->Bool {
        
        var carre = false
        
        for i in 0...1{
            
            if tab[i] == tab[i+1] && tab[i] == tab[i+2] && tab[i] == tab[i+3]{
                
                carre = true
            }
        }
        
        if carre {
            
            return true
        }
        else{
            
            return false
        }
        
    }
    
    func isFull(tab : Array<Int>) ->Bool {
        
        var full = false

        
        if full{
            
            return true
        }
        else{
            
            return false
        }
    }
    
    func isFlush(tab : Array<Int>) ->Bool {
        
        if tab[0] == tab[1] && tab[0] == tab[2] && tab[0] == tab[3] && tab[0] == tab[4]
        {
            return true
        }
        else{ return false }
    }
    
    func isQuinte(tab : Array<Int>) ->Bool {
        
        var quinte = false
        
        if tab[0] == tab[1]+1 {
            if tab[1] == tab[2]+1 {
                if tab[2] == tab[3]+1 {
                    if tab[3] == tab[4]+1 {
                        quinte = true
                    }
                }
            }
        }
        else if tab[0] == 14 && tab[1] == 5 && tab[2] == 4 && tab[3] == 3 && tab[4] == 2{
            quinte = true
        }
        
        if quinte{
            
            return true
        }
        else{
            
            return false
        }
    }
    
    func isQuinteFlush(tabVal : Array<Int>, tabCoul: Array<Int>) ->Bool {
        
        var quinteFlush = false
        
        if tabCoul[0] == tabCoul[4] {
            
            if tabVal[0] <= 10 {
                if tabVal[0] == tabVal[1]+1 {
                    if tabVal[1] == tabVal[2]+1 {
                        if tabVal[2] == tabVal[3]+1 {
                            if tabVal[3] == tabVal[4]+1 {
                                quinteFlush = true
                            }
                        }
                    }
                }
            }
            else if tabVal[0] == 14 && tabVal[1] == 5 && tabVal[2] == 4 && tabVal[3] == 3 && tabVal[4] == 2{
                quinteFlush = true
            }
            
        }
        
        if quinteFlush{
            
            return true
        }
        else{
            
            return false
        }
    }
    
    func isQuinteFlushRoyale(tabVal : Array<Int>, tabCoul: Array<Int>) ->Bool {
        
        var quinteFlushRoyale = false
        
        if tabCoul[0] == tabCoul[4] {
            if tabVal[0] == 14 {
                if tabVal[0] == tabVal[1]+1 {
                    if tabVal[1] == tabVal[2]+1 {
                        if tabVal[2] == tabVal[3]+1 {
                            if tabVal[3] == tabVal[4]+1 {
                                quinteFlushRoyale = true
                            }
                        }
                    }
                }
            }
        }
        
        if quinteFlushRoyale{
            
            return true
        }
        else{
            
            return false
        }
    }
    
    // Trier le tableau de valeurs
    func triParValeur(tapis: Paquet)->Array<Int>{
        
        tabValeur = [tapis[0].valeur.rawValue , tapis[1].valeur.rawValue, tapis[2].valeur.rawValue, tapis[3].valeur.rawValue, tapis[4].valeur.rawValue]
        
        // Tri du tapis dans l'ordre décroissant
        tabValeur.sorted(by: >)
        
        return tabValeur
    }
    
    // Trier le tableau de couleurs
    func triParCouleur(tapis: Paquet)->Array<Int>{
        
        tabCouleur = [tapis[0].couleur.rawValue , tapis[1].couleur.rawValue, tapis[2].couleur.rawValue, tapis[3].couleur.rawValue, tapis[4].couleur.rawValue]
        
        // Tri du tapis dans l'ordre décroissant
        tabCouleur.sorted(by: >)
        
        return tabCouleur
        
    }
    
    
    
    
}
