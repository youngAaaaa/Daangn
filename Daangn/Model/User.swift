//
//  User.swift
//  Daangn
//
//  Created by macbook air on 2022/06/01.
//

import Foundation

struct User {
    var nickName: String
    var address: String
}

class UserModel {
    private var storage: [String: User] = [:]
    
    init() {
        storage = [
            "데이": User(nickName: "데이", address: "우동"),
            "벨라왕": User(nickName: "벨라왕", address: "반송동"),
            "수로": User(nickName: "수로", address: "반여동"),
            "마하": User(nickName: "마하", address: "우동"),
            "구씨": User(nickName: "구씨", address: "석대동"),
            "기루": User(nickName: "기루", address: "재송동"),
            "내다내": User(nickName: "내다내", address: "송정동"),
            "해뜰날": User(nickName: "해뜰날", address: "좌동")
        ]
    }
    
    var count: Int {
        return storage.count
    }
    
    func returnUserInfo(_ nickName: String) -> User {
        return storage[nickName] ?? User(nickName: "", address: "")
    }
}
