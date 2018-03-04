//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/24/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var charactersCollectionView: UICollectionView!
    struct CharactersConstants {

        static let titleString = "Characters"
        static let characterCellIdentifier = "characterCell"
        static let characterDetailIdentifier = "characterDetails"
        
    }

    let networkwManager = NetworkManager()
    var charactersArray : [Character] = []
    let utils = Utilities()
    var selectedRow: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = CharactersConstants.titleString
        loadCharacters()

        // Do any additional setup after loading the view.
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == CharactersConstants.characterDetailIdentifier {
            if let destinationVC = segue.destination as? CharacterDetailsTableViewController {
                
                guard let selected = selectedRow else {
                    return
                }
                destinationVC.character = charactersArray[selected]                
            }
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}


extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: CharactersConstants.characterDetailIdentifier, sender: self)
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
            
        })
        
    }
    
}
