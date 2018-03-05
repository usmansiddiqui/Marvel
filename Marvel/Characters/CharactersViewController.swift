//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/24/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    
    var charactersCollectionView: UICollectionView!
    struct CharactersConstants {

        static let titleString = "Characters"
        static let characterCellIdentifier = "characterCell"
        static let characterDetailIdentifier = "characterDetails"
        
    }

    let networkwManager = NetworkManager()
    var charactersArray : [Character] = []
    let utils = Utilities()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = CharactersConstants.titleString
        setupCharactersCollectionView()
        loadCharacters()

        navigationItem.hidesBackButton = true
        
        // Do any additional setup after loading the view.
    }
    
    func setupCharactersCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:0, left: 20, bottom: 0, right: 20)
        layout.itemSize = CGSize(width: 150, height: 250)
        
        
        charactersCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        charactersCollectionView.delegate   = self
        charactersCollectionView.dataSource = self
        charactersCollectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharactersConstants.characterCellIdentifier)
        charactersCollectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(charactersCollectionView)
        
        charactersCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.left.equalTo(view)
            make.right.equalTo(view)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func loadCharacters() {
        networkwManager.getCharacters(completion: {
            characters in
            self.charactersArray = characters
            
            DispatchQueue.main.async {
                self.charactersCollectionView.reloadData()
            }
            
        })
    }
    

}


extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let charactersDetailVC = CharacterDetailsTableViewController()
        navigationController?.pushViewController(charactersDetailVC, animated: true)
        charactersDetailVC.character = charactersArray[indexPath.row]
    }
    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersConstants.characterCellIdentifier, for: indexPath) as? CharacterCollectionViewCell {
            configureCell(cell: cell, character: charactersArray[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return charactersArray.count
        
    }
    
    func configureCell(cell: CharacterCollectionViewCell, character: Character) {
        cell.characterName.text = character.characterName
        networkwManager.getImage(urlString: utils.getCharacterPortraitImgURL(imgPath: character.imagePath, imgExtension: character.imgExtension), completionHandler: {
             image in
            cell.characterImage.image = image
            cell.characterImage.layer.borderWidth = 4.0
            cell.characterImage.layer.masksToBounds = true
            cell.characterImage.layer.cornerRadius = 10.0
            cell.characterImage.layer.borderColor = UIColor.white.cgColor
            cell.characterImage.contentMode = .scaleAspectFit
            
        })
        
    }
    
}
