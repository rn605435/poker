//
//  Carte.swift
//  Cartes
//
//  Created by ROCHETTE Nicolas on 13/11/2018.
//  Copyright © 2018 ROCHETTE Nicolas. All rights reserved.
//

import Foundation

public struct Carte : Comparable, Strideable{
    
    
    public func distance(to other: Carte) -> Int {
        return self.rawValue! - other.rawValue!
    }
    public func advanced(by n: Int) -> Carte {
        return Carte(rawValue: n + self.rawValue!)
    }
    
    public static func < (lhs: Carte, rhs: Carte) -> Bool {
        return lhs.rawValue! < rhs.rawValue!
    }
    
    let couleur: Couleur
    let valeur: Valeur
    let description: String
    let rawValue: Int?
    
    init(couleur: Couleur = Carte.Couleur.COEUR, valeur: Valeur = Carte.Valeur.as) {
        self.couleur = couleur
        self.valeur = valeur
        self.description = valeur.description + couleur.description
        self.rawValue = (valeur.rawValue-2) + (couleur.rawValue * 13)
    }
    init(rawValue r:Int = 51){
        if(r<52 && r>=0){
            self.rawValue = r
            self.couleur = Carte.Couleur(rawValue: r / 13)!
            self.valeur = Carte.Valeur(rawValue: r % 13 + 2)!
            self.description = valeur.description + couleur.description
        }
        else{
            self.rawValue = nil
            self.couleur = Carte.Couleur(rawValue: r / 13)!
            self.valeur = Carte.Valeur(rawValue: r % 13 + 2)!
            self.description = valeur.description + couleur.description
        }
    }
    
    public enum Valeur : Int
    {
        case deux = 2, trois, quatre, cinq, six, sept, huit, neuf, dix,
        valet, dame, roi, `as`
        
        var description: String {
            switch self {
            case .deux:
                return "2"
            case .trois:
                return "3"
            case .quatre:
                return "4"
            case .cinq:
                return "5"
            case .six:
                return "6"
            case .sept:
                return "7"
            case .huit:
                return "8"
            case .neuf:
                return "9"
            case .dix:
                return "T"
            case .valet:
                return "J"
            case .dame:
                return "Q"
            case .roi:
                return "K"
            case .as:
                return "A"
            }
        }
    }
    public enum Couleur : Int
    {
        case TREFLE = 0
        case CARREAU = 1
        case COEUR = 2
        case PIQUE = 3
        var description: String {
            switch self {
            case .CARREAU:
                return "♦"
            case .COEUR:
                return "♥"
            case .PIQUE:
                return "♠"
            case .TREFLE:
                return "♣"
            }
        }
    }
    
    
}

extension Carte : ExpressibleByStringLiteral {
    public init(stringLiteral: String){
        let v = stringLiteral.first!
        let c = stringLiteral.last!
        let n = Int(String(c))
        var value : Carte.Valeur = .as
        var color : Carte.Couleur = .COEUR
        switch String(v) {
        case "2" : value = Valeur.deux
        case "3" : value = .trois
        case "4" : value = .quatre
        case "5" : value = .cinq
        case "6" : value = .six
        case "7" : value = .sept
        case "8" : value = .huit
        case "9" : value = .neuf
        case "T" : value = .dix
        case "J" : value = .valet
        case "Q" : value = .dame
        case "R" : value = .roi
        case "A" : value = .as
        default:
            break
        }
        switch c {
        case "♣" : color = .TREFLE
        case "♦" : color = .CARREAU
        case "♥" : color = .COEUR
        case "♠" : color = .PIQUE
        default:
            break
        }
        self.couleur = color;
        self.valeur = value;
        self.description = valeur.description + couleur.description
        self.rawValue = (valeur.rawValue-2) + (couleur.rawValue * 13)
    }
}
