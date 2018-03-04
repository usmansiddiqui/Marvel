//
//  Character.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/26/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import Foundation

class Character: NSObject {
    
    var characterId = ""
    var characterName = ""
    var imagePath = ""
    var imgExtension = ""
    
    var storiesArr : [CharactersData] = []
    var eventsArr : [CharactersData] = []
    var comicsArr : [CharactersData] = []
    var seriesArr : [CharactersData] = []
    
}
