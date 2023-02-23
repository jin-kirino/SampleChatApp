//
//  MessageElement.swift
//  SampleChatApp
//
//  Created by 神　樹里乃 on 2022/09/18.
//

import Foundation

// FirebaseのCloud Firestoreの読み書きする
struct messageElement: Identifiable {
    var id: String
    var name: String
    var message: String
    var createAt: Date
}
