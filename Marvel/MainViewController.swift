//
//  ViewController.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/24/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var touchStartLabel: UILabel!
    var timer = Timer()
    
    var charactersSegueIdentifier = "showCharacters"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchStartLabel.text = "Tap anywhere to continue"
        animateLabel()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func animateLabel() {
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector:#selector(timerAction) , userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        touchStartLabel.alpha = 1
        UIView.animate(withDuration: 1.5, animations: {
            self.touchStartLabel.alpha = 0
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        performSegue(withIdentifier: charactersSegueIdentifier, sender: self)
        
        timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }


}

