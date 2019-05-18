//
//  FuriganaRepository.swift
//  yumemi
//
//  Created by kitaharamugirou on 2019/05/18.
//  Copyright © 2019 kitaharamugirou. All rights reserved.
//

import Foundation
class FuriganaRepository {
    //singleton
    let apiClient = APIClient.shared
    
    func fetchFurigana(sentence : String , completion : @escaping (FuriganaResponse) -> ()) {
        let request = FuriganaRequest(appid: apiConst.appid, sentence: sentence)
        apiClient.easyCall(request: request, success:
            {res in
                completion(res)
        }, failure: {
            //Not do any error handling
        })
    }
}
