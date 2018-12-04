//
//  AppDelegate.swift
//  TP5
//
//  Created by ROCHETTE Nicolas on 20/11/2018.
//  Copyright © 2018 ROCHETTE Nicolas. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var valCaisse: NSTextField!
    @IBOutlet weak var valPari: NSTextField!
    @IBOutlet weak var carte1: CarteView!
    @IBOutlet weak var carte2: CarteView!
    @IBOutlet weak var carte3: CarteView!
    @IBOutlet weak var carte4: CarteView!
    @IBOutlet weak var carte5: CarteView!
    
    @IBOutlet weak var gain: NSTextField!
    @IBOutlet weak var notif: NSTextField!
    @IBOutlet weak var erreur: NSTextField!
    @IBOutlet weak var instruct: NSTextField!
    @IBOutlet weak var btnJouer: NSButton!
    @IBOutlet weak var btnRejouer: NSButton!
    @IBOutlet weak var btnFindetour: NSButton!
    @IBOutlet weak var btnFindepartie: NSButton!

    @IBOutlet weak var txtNbtour: NSTextField!
    @IBOutlet weak var txtRules: NSTextField!
    
    @IBOutlet weak var btnAjoute: NSButton!
    @IBOutlet weak var btnEnleve: NSButton!
    
    var nCaisse: Int32 = 100
    var nPari: Int32 = 0
    var p : Paquet = Paquet()
    var tapis : Paquet = Paquet()
    var pTemp : Paquet = Paquet()
    let argent = Argent(500)
    
    var tabValeur = Array<Int>()
    var tabCouleur = Array<Int>()

    var multiplicateurScore: Int32 = 0
    var fin = false
    var nbTour : Int = 1
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window.backgroundColor = NSColor.green
        valCaisse.intValue = Int32(argent.porteFeuille)
        nCaisse = Int32(argent.porteFeuille)
        nPari = 0
        p = Paquet.jeuComplet
        melangeEtDistribue()
        cacherCartes()
        gel()
        notif.stringValue = ""
        gain.stringValue = ""
        erreur.isHidden = true
        instruct.stringValue = "Veuillez parier pour commencer la partie"
        notif.stringValue = "Début du jeu"
        btnRejouer.isHidden = true
        btnJouer.isEnabled = true
        btnAjoute.isEnabled = true
        btnEnleve.isEnabled = true
        btnFindepartie.isHidden = true
        btnFindetour.isHidden = true
        fin = false
        txtRules.isHidden = true
        txtNbtour.isHidden = true
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    @IBAction func ajoute(_ sender: NSButton) {
        
        //nPari = valPari.intValue
        //nCaisse = valCaisse.intValue
        
        if(nCaisse > 0){
            nCaisse -= 5
            nPari += 5
            argent.mise += 5
        }
        
        valCaisse.intValue = nCaisse
        valPari.intValue = nPari
    }
    
    @IBAction func enleve(_ sender: NSButton) {
        if nPari > 0 {
            
            nCaisse += 5
            nPari -= 5
            argent.mise -= 5
        }
        
        valCaisse.intValue = nCaisse
        valPari.intValue = nPari
    }
    @IBAction func jouer(_ sender: NSButton) {
        
        notif.stringValue = ""
        degel()
        // no bet
        if nPari == 0{
            
            erreur.isHidden = false
            erreur.stringValue = "Attention la mise ne peut pas être égale à 0"
        }
            // bet
        else{
            txtNbtour.isHidden = false
            txtNbtour.stringValue = "Nombre de tours restant " + String(10-nbTour)
            nbTour += 1
            btnFindepartie.isHidden = false
            btnFindetour.isHidden = false
            erreur.isHidden = true
            instruct.isHidden = false
            instruct.stringValue = "Choisissez les cartes\nque vous voulez changer"
            
            // Première étape
            if fin == false{
                
                melangeEtDistribue()
                
                btnEnleve.isEnabled = false
                btnAjoute.isEnabled = false
                
                afficherCartes()
                degel()
                
                fin = true
            }
                // Change les cartes choisies
            else{
                finDeTour()
                
                p.ajouteDessous(tapis)
                tapis.cartes.removeAll()
                
                
                afficherCartes()
                
                
                instruct.stringValue = ""
                notif.stringValue = ""
            }
            btnJouer.isHidden = true
            
        }
    }
    
    @IBAction func btnRejouer(_ sender: NSButton) {
        notif.stringValue = ""
        
        fin = false
        nbTour = 1
        nPari = 0
        nCaisse = valCaisse.intValue
        valPari.stringValue = String(0)
        gain.isHidden = true
        notif.stringValue = "Début du jeu"
        instruct.stringValue = "Veuillez parier pour commencer la partie"
        btnJouer.isHidden = false
        btnJouer.isEnabled = true
        
        btnRejouer.isHidden = true
        btnAjoute.isEnabled = true
        btnEnleve.isEnabled = true
        argent.combinaison = 0
        
        cacherCartes()
        pTemp.cartes.removeAll()
        
    }
    
    @IBAction func btnFindetour(_ sender: NSButton) {
        if(nbTour <= 10){
            txtNbtour.isHidden = false
            txtNbtour.stringValue = "Nombre de tours restant " + String(10-nbTour)
            finDeTour()
            nbTour += 1
            argent.tour = nbTour
            argent.combinaison = Int(multiplicateurScore)
            gain.stringValue = "Gain : " + String(argent.gain)
            gain.isHidden = false
        }
        else {
            finDePartie()
            
        }
        
    }
    
    @IBAction func btnFindepartie(_ sender: NSButton) {
        finDePartie()
    }
    
    func finDePartie(){
        gel()
        txtNbtour.isHidden = true
        btnJouer.isHidden = true
        btnJouer.isEnabled = false
        btnRejouer.isHidden = false
        btnFindetour.isHidden = true
        btnFindepartie.isHidden = true
        argent.combinaison = Int(multiplicateurScore)
        valCaisse.intValue = Int32(argent.updatePorteFeuille())
        instruct.stringValue = "Partie terminée"
        notif.stringValue = ""
        gain.isHidden = true
    }
    
    
    func melangeEtDistribue() {
        
        p.melange()
        
        carte1.carte = p.enleveDessus()!
        carte2.carte = p.enleveDessus()!
        carte3.carte = p.enleveDessus()!
        carte4.carte = p.enleveDessus()!
        carte5.carte = p.enleveDessus()!
        
        tapis.ajouteDessus(carte5.carte)
        tapis.ajouteDessus(carte4.carte)
        tapis.ajouteDessus(carte3.carte)
        tapis.ajouteDessus(carte2.carte)
        tapis.ajouteDessus(carte1.carte)
        
        gel()
    }
    func gel(){
        
        carte1.estGelée = true
        carte2.estGelée = true
        carte3.estGelée = true
        carte4.estGelée = true
        carte5.estGelée = true
    }
    func degel(){
        
        carte1.estGelée = false
        carte2.estGelée = false
        carte3.estGelée = false
        carte4.estGelée = false
        carte5.estGelée = false
    }
    func afficherCartes(){
        
        carte1.estAffichee = true
        carte2.estAffichee = true
        carte3.estAffichee = true
        carte4.estAffichee = true
        carte5.estAffichee = true
        
    }
    func cacherCartes(){
        
        carte1.estAffichee = false
        carte2.estAffichee = false
        carte3.estAffichee = false
        carte4.estAffichee = false
        carte5.estAffichee = false
    }
    
    func finDeTour(){
        if carte1.estAffichee == false{
            
            pTemp.ajouteDessus(carte1.carte)
            tapis.cartes.remove(at: 0)
            carte1.carte = p.enleveDessus()!
            tapis.cartes.insert(carte1.carte, at: 0)
            carte1.estAffichee = true
        }
        
        if carte2.estAffichee == false{
            
            pTemp.ajouteDessus(carte2.carte)
            tapis.cartes.remove(at: 1)
            carte2.carte = p.enleveDessus()!
            tapis.cartes.insert(carte2.carte, at: 1)
            carte2.estAffichee = true
        }
        if carte3.estAffichee == false{
            
            pTemp.ajouteDessus(carte3.carte)
            tapis.cartes.remove(at: 2)
            carte3.carte = p.enleveDessus()!
            tapis.cartes.insert(carte3.carte, at: 2)
            carte3.estAffichee = true
        }
        if carte4.estAffichee == false{
            
            pTemp.ajouteDessus(carte4.carte)
            tapis.cartes.remove(at: 3)
            carte4.carte = p.enleveDessus()!
            tapis.cartes.insert(carte4.carte, at: 3)
            carte4.estAffichee = true
        }
        if carte5.estAffichee == false{
            
            pTemp.ajouteDessus(carte5.carte)
            tapis.cartes.remove(at: 4)
            carte5.carte = p.enleveDessus()!
            tapis.cartes.insert(carte5.carte, at: 4)
            carte5.estAffichee = true
        }
        
        if pTemp.estVide == false{
            
            p.ajouteDessous(pTemp)
        }
        
        // Bloque les cartes
        //gel()
        
        btnJouer.isEnabled = false
        
        let main = TestMain(carte1.carte, carte2.carte, carte3.carte, carte4.carte, carte5.carte)
        let t = main.verification()
        
        if (t == true) {
            if(main.pair()) {
                notif.stringValue = "Vous avez une Paire"
            }
            if(main.doublePair()) {
                notif.stringValue = "Vous avez une Double Paire"
                
            }
            if(main.brelan()) {
                notif.stringValue = "Vous avez un Brelan"
            }
            if(main.suite()) {
                notif.stringValue = "Vous avez une Suite"
            }
            if(main.couleur()) {
                notif.stringValue = "Vous avez une Couleur"
            }
            if(main.full()) {
                notif.stringValue = "Vous avez un Full"
            }
            if(main.carre()) {
                notif.stringValue = "Vous avez un Carré"
            }
            if(main.quinte()) {
                notif.stringValue = "Vous avez une Quinte"
            }
            if(main.quinteFlushRoyal()) {
                notif.stringValue = "Vous avez une Quinte Flush"
            }
            multiplicateurScore = main.bonus
            
    }

}
    
    @IBAction func displayRules(_ sender: NSButton) {
        if (txtRules.isHidden == true){
            txtRules.isHidden = false;
        }
        else {
            txtRules.isHidden = true;
        }
        
        
    }
}

