//
//  FuriganaUsecase.swift
//  yumemi
//
//  Created by kitaharamugirou on 2019/05/18.
//  Copyright © 2019 kitaharamugirou. All rights reserved.
//

import Foundation
class FuriganaUsecase {
    let rep = FuriganaRepository()
    
    func fetchFurigana(sentence : String , completion : @escaping (String) -> ()) {
        if sentence.isEmpty {
            completion("")
            return
        }
        rep.fetchFurigana(sentence: sentence) { res in
            var furigana = ""
            for word in res.Result.WordList {
                for detail in word.Word {
                    furigana += detail.Furigana ?? detail.Surface ?? ""
                }
            }
            completion(furigana)
        }
    }
}
