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
    //近くにいる人数を取得する
    func test() {
        let request = FuriganaRequest(appid: apiConst.appid, sentence: "今日はいい天気ですね", grade: "3")
        apiClient.call(request: request, success:
            {res in
                print("success : test success")
                print(res)
        }, failure: {
            print("error : test error")
        })
    }
}
