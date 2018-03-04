//
//  Configuration.swift
//  Marvel
//
//  Created by Usman Siddiqui on 2/24/18.
//  Copyright © 2018 Usman_Siddiqui. All rights reserved.
//

import Foundation

struct Configuration {
    let baseURL = "https://gateway.marvel.com:443/v1/public"
    let privateKey = "d5aee3824e86e2f079088bd994e9f940e5f72947"
    let publicKey = "04a8e132563665fc47691822a9d742c2"
    let md5Hash = "3b07853d58a631c647bff73ba73d6068" //Already generated MD5 hash
    //Since API requires MD5, i have created it using a hardcoded timestamp and will be using that for API calls. Else i have to add something like CommonCrypto to generate MD5 with actual timestamps.
    let ts = "02/13/13:23:32"//hardcoded timestamp we will be using for our API calls.
    let characterPath = "/characters?"
    
    func getAllCharactersURLString() -> String {
        return  baseURL + characterPath + "apikey=\(publicKey)" + "&ts=\(ts)" + "&hash=\(md5Hash)"
    }
    
    func getCharacterByIDURLString(characterId: String) {
        
    }
}


//enum APIError: Error, LocalizedError {
//    case zeroBytesInResponse
//    case tokenInvalid
//    case tokenMissing
//
//    var errorDescription: String? {
//        switch self {
//        case .zeroBytesInResponse:
//            return zipZeroBytesErrorMessageString
//        case .tokenInvalid:
//            return zipFileExpiredTokenErrorMessageString
//        case .tokenMissing:
//            return loginTimeoutErrorString
//        }
//    }
//}

