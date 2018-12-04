//
//  CarteView.swift
//  TP5
//
//  Created by ROCHETTE Nicolas on 20/11/2018.
//  Copyright © 2018 ROCHETTE Nicolas. All rights reserved.
//

import Cocoa

class CarteView: NSView {
    
    var carte : Carte = Carte(couleur: .TREFLE, valeur: .deux)
    {
        didSet{
            
            setNeedsDisplay(self.bounds)
        }
    }
    
    
    var estAffichee : Bool = false {
        didSet{
            
            setNeedsDisplay(self.bounds)
        }
    }
    
    var estGelée: Bool = false {
        
        didSet{
            
            setNeedsDisplay(self.bounds)
        }
    }
    
    // Afficher les cartes dans CarteView selon la carte
    override func draw(_ dirtyRect: NSRect) {
        
        super.draw(dirtyRect)
        if estAffichee
        {
            if(carte.couleur == .TREFLE)
            {
                for x in 2 ... 14
                {
                    if(carte.valeur.rawValue == x)
                    {
                        if(x != 14)
                        {
                            if let imageCarte = NSImage(named: "deck")
                            {
                                imageCarte.draw(in: self.bounds, from: NSRect(x: (x-1)*150, y: 0, width: 150, height: 200), operation: NSCompositingOperation.copy, fraction: 1)
                            }
                        }
                        else
                        {
                            if let imageCarte = NSImage(named: "deck")
                            {
                                imageCarte.draw(in: self.bounds, from: NSRect(x: 0, y: 0, width: 150, height: 200), operation: NSCompositingOperation.copy, fraction: 1)
                            }
                        }
                        
                    }
                }
                
            }
            if(carte.couleur == .PIQUE)
            {
                
                for x in 2 ... 14
                {
                    if(carte.valeur.rawValue == x)
                    {
                        if(x != 14)
                        {
                            if let imageCarte = NSImage(named: "deck")
                            {
                                imageCarte.draw(in: self.bounds, from: NSRect(x: (x-1)*150, y: 200, width: 150, height: 200), operation: NSCompositingOperation.copy, fraction: 1)
                            }
                        }
                        else
                        {
                            if let imageCarte = NSImage(named: "deck")
                            {
                                imageCarte.draw(in: self.bounds, from: NSRect(x: 0, y: 200, width: 150, height: 200), operation: NSCompositingOperation.copy, fraction: 1)
                            }
                        }
                        
                    }
                }
                
            }
            
            if(carte.couleur == .CARREAU)
            {
                
                for x in 2 ... 14
                {
                    if(carte.valeur.rawValue == x)
                    {
                        if(x != 14)
                        {
                            if let imageCarte = NSImage(named: "deck")
                            {
                                imageCarte.draw(in: self.bounds, from: NSRect(x: (x-1)*150, y: 400, width: 150, height: 200), operation: NSCompositingOperation.copy, fraction: 1)
                            }
                        }
                        else
                        {
                            if let imageCarte = NSImage(named: "deck")
                            {
                                imageCarte.draw(in: self.bounds, from: NSRect(x: 0, y: 400, width: 150, height: 200), operation: NSCompositingOperation.copy, fraction: 1)
                            }
                        }
                        
                    }
                }
            }
            if(carte.couleur == .COEUR)
            {
                
                for x in 2 ... 14
                {
                    if(carte.valeur.rawValue == x)
                    {
                        if(x != 14)
                        {
                            if let imageCarte = NSImage(named: "deck")
                            {
                                imageCarte.draw(in: self.bounds, from: NSRect(x: (x-1)*150, y: 600, width: 150, height: 200), operation: NSCompositingOperation.copy, fraction: 1)
                            }
                        }
                        else
                        {
                            if let imageCarte = NSImage(named: "deck")
                            {
                                imageCarte.draw(in: self.bounds, from: NSRect(x: 0, y: 600, width: 150, height: 200), operation: NSCompositingOperation.copy, fraction: 1)
                            }
                        }
                        
                    }
                }
            }
            
            
        }
        else
        {
            if let imageDos = NSImage(named: "dos")
            {
                imageDos.draw(in: self.bounds, from: NSRect(x: 0, y: 0, width: imageDos.size.width, height: imageDos.size.height), operation: NSCompositingOperation.copy, fraction: 1)
            }
            
        }
        
    }
    
    override func mouseDown(with Event: NSEvent) {
        
        if( estGelée == false ){
            // si la carte n'est pas gelée alors on peut la retourner
            if(estAffichee == false) // si elle n'est pas affichée
            {
                estAffichee = true //on l'affiche
            }
            else // sinon si elle est affiche
            {
                estAffichee = false // on la cache
            }
        }
        
    }
    
}
