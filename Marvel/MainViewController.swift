//
//  ViewController.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/24/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    var touchStartLabel: UILabel!
    var timer = Timer()
    
    var charactersSegueIdentifier = "showCharacters"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        animateLabel()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupUI() {
        
        let logo = UIImageView(image: UIImage(named: "logo"))
        view.addSubview(logo)
        
        logo.snp.makeConstraints { (make) in
            
            make.width.equalTo(268)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
        touchStartLabel = UILabel()
        touchStartLabel.text = "Tap anywhere to continue"
        touchStartLabel.textColor = .lightGray
        touchStartLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        view.addSubview(touchStartLabel)
        
        touchStartLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-20)
            make.centerX.equalToSuperview()
            //make.centerY.equalToSuperview()
        }
        
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
        
        let charactersVC = CharactersViewController()
        navigationController?.pushViewController(charactersVC, animated: true)
        
        timer.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

