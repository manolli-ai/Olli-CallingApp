//
//  Utilities.swift
//  idoubs
//
//  Created by Man Huynh on 2/6/18.
//  Copyright © 2018 Doubango Telecom. All rights reserved.
//

import Foundation

class GetDefaultValues {
    var impu: String = "sip:1001@35.197.128.55:5060"
    let userDefault: UserDefaults = UserDefaults()
    public func makeImpuAdress(id:String, pass: String) {
        self.impu = "sip:" + id + "@35.197.128.55:5060"
        userDefault.set(self.impu, forKey: "IDENTITY_IMPU")
        userDefault.set(pass, forKey: "IDENTITY_PASSWORD")
    }
}
