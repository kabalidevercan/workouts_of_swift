//
//  ViewController.swift
//  Timer Uygulama
//
//  Created by Ercan Kabali on 27.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var sayici:Timer?
    var sayac:Int = 1
    var sayac2:Int = 5
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var ciktiLabel: UILabel!
    
    @IBAction func start(_ sender: Any) {
        sayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ileriSar), userInfo: nil, repeats: true)
        
        
    }
    
    @IBAction func geriSar(_ sender: Any) {
        
        sayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(geri), userInfo: nil, repeats: true)
        
        
    }
    
    
    @objc func geri(){
        ciktiLabel.text = String(sayac2)
        sayac2 -= 1
        
        if sayac2 < 0{
            sayici?.invalidate()
            ciktiLabel.text = "Sifiri Tukettin bremin!"
            sayac2 = 5
        }
    }
    
    @objc func ileriSar(){
        ciktiLabel.text = String(sayac)
        sayac += 1
        
        if sayac > 6 {
            sayici?.invalidate()
            ciktiLabel.text = "Sure bitti!"
            sayac = 1
        }
        
    }
    
}

