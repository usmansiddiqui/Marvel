//
//  NetworkManager.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/26/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class NetworkManager {
    
    let config = Configuration()
    
    func getCharacters(completion: @escaping([Character]) -> Void) {
                
        Alamofire.request(config.getAllCharactersURLString()).responseJSON { response in

            guard let data = response.data else {
                return
            }
            
            if let json = try? JSON(data: data) {
                completion(self.populateCharactersData(json: json))
            }
            
        }
        
    }
    
    func getImage(urlString: String, completionHandler: @escaping (UIImage) -> Void) {
        
        Alamofire.request(urlString).responseImage { response in
            if let image = response.result.value {
                completionHandler(image)
            }
        }
        
    }
    func populateCharactersData(json: JSON) -> [Character] {
        var charArray : [Character] = []
        if let results = json["data"]["results"].array {
            
            
            for result in results {
                
                let character = Character()
                character.characterName = result["name"].string ?? ""
                character.characterId = String(result["id"].int ?? 0)
                character.imagePath = result["thumbnail"]["path"].string ?? ""
                character.imgExtension = result["thumbnail"]["extension"].string ?? ""
                
                
                if let comics = result["comics"]["items"].array {
                    
                    for comic in comics {
                        let comicData = CharactersData()
                        comicData.name = comic["name"].string ?? ""
                        comicData.resourceURI = comic["resourceURI"].string ?? ""
                        character.comicsArr.append(comicData)
                    }
                    
                }
                
                if let stories = result["stories"]["items"].array {
                    
                    for story in stories {
                        let storyData = CharactersData()
                        storyData.name = story["name"].string ?? ""
                        storyData.resourceURI = story["resourceURI"].string ?? ""
                        character.storiesArr.append(storyData)
                    }
                    
                }
                
                if let events = result["events"]["items"].array {
                    
                    for event in events {
                        let eventData = CharactersData()
                        eventData.name = event["name"].string ?? ""
                        eventData.resourceURI = event["resourceURI"].string ?? ""
                        character.eventsArr.append(eventData)
                    }
                    
                }
                
                if let serieses = result["series"]["items"].array {
                    for series in serieses {
                        let seriesData = CharactersData()
                        seriesData.name = series["name"].string ?? ""
                        seriesData.resourceURI = series["resourceURI"].string ?? ""
                        character.seriesArr.append(seriesData)
                    }
                }
                
                charArray.append(character)
            }
            
        }
        return charArray
    }
    
}


