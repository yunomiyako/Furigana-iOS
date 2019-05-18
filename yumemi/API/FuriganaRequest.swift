//
//  furigana.swift
//  yumemi
//
//  Created by kitaharamugirou on 2019/05/18.
//  Copyright © 2019 kitaharamugirou. All rights reserved.
//

import Foundation
import Alamofire
struct FuriganaRequest : RequestProtocol {
    var parameters: Parameters?
    typealias Response = FuriganaResponse
    var path = "FuriganaService/V1/furigana"
    
    init(appid : String , sentence : String , grade : String) {
        self.parameters = [
            "appid" : appid ,
            "sentence" : sentence ,
            "grade" : grade
        ]
    }
}

class FuriganaResponse : ResponseProtocol {
    var res : [ FuriganaResponseDataModel ]
    
}

class FuriganaResponseDataModel : Decodable {
    let ResultSet : [FuriganaResult]
}

class FuriganaResult : Decodable {
    let WordList : [Word]
}

class Word : Decodable {
    let Surface : String?
    let Furigana : String?
    let Roman : String?
    let SubWordList : [SubWord]?
}

class SubWord : Decodable {
    let Surface : String?
    let Furigana : String?
    let Roman : String?
}
