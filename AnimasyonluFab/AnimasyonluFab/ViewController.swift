//
//  ViewController.swift
//  AnimasyonluFab
//
//  Created by Ercan Kabali on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var fabDurum :Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fubMainOutlet.layer.cornerRadius = fubMainOutlet.frame.size.width/2
        
        fabBirinciOutlet.layer.cornerRadius = fabBirinciOutlet.frame.size.width/2
        
        fubIkinciOutlet.layer.cornerRadius = fubIkinciOutlet.frame.size.width/2
    
        self.fabBirinciOutlet.alpha = 0
        self.fubIkinciOutlet.alpha = 0
        self.fabBirinciOutlet.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.fubIkinciOutlet.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        
    }

    @IBAction func fubMain(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            if self.fabDurum {
                self.fabBirinciOutlet.alpha = 0
                self.fubIkinciOutlet.alpha = 0
                self.fabDurum = false
                self.fubMainOutlet.transform =  CGAffineTransform(rotationAngle: 0 * .pi/180)
                self.fabBirinciOutlet.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.fubIkinciOutlet.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                 
            }else {
                self.fabBirinciOutlet.alpha = 1
                self.fubIkinciOutlet.alpha = 1
                self.fabDurum = true
                self.fubMainOutlet.transform  = CGAffineTransform(rotationAngle: 45 * .pi/180  )
                self.fabBirinciOutlet.transform = CGAffineTransform(scaleX: 1, y:  1)
                self.fubIkinciOutlet.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }, completion: nil)
        
        
        
    }
    
    @IBOutlet weak var fubMainOutlet: UIButton!
    
    
    @IBAction func fubBirinci(_ sender: Any) {
    }
    
    @IBOutlet weak var fabBirinciOutlet: UIButton!
    
    @IBAction func fubIkinci(_ sender: Any) {
    }
    
    @IBOutlet weak var fubIkinciOutlet: UIButton!
    
    
}

