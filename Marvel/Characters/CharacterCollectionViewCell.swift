//
//  CharacterCollectionViewCell.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/24/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    var characterImage: UIImageView!
    var characterName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        characterImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 225))
        contentView.addSubview(characterImage)
        
        characterImage.snp.makeConstraints { (make) in
            
            make.width.equalTo(150)
            make.height.equalTo(225)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            
        }            
        characterName = UILabel()
        characterName.font = UIFont.preferredFont(forTextStyle: .caption1)
        characterName.textAlignment = .center
        characterName.textColor = UIColor.colorWithHexValue("FF0000")
        contentView.addSubview(characterName)
        
        characterName.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView).offset(-5)
            //make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
