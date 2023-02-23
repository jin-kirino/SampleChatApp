//
//  MessageRow.swift
//  SampleChatApp
//
//  Created by 神　樹里乃 on 2022/09/18.
//

import SwiftUI

// Chatの吹き出しUI
struct MessageRow: View {
    // メッセージ本体
    let message: String
    // 自分はtrue、相手はfalse
    let isMyMessage: Bool
    // ユーザー名
    let user: String
    // シンプル時刻
    let date: Date
    
    var body: some View {
        HStack {
            // 自分が送ったメッセージ
            if isMyMessage {
                let _ = print("\(#fileID) \(#line) kirino自分が送ったメッセージ")
                // 右寄りに表示
                Spacer()
                
                VStack {
                    Text(message)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(6)
                        .foregroundColor(Color.white)
                    Text(date.text)
                        .font(.callout)
                }
            // 相手から送られたメッセージ
            } else {
                let _ = print("\(#fileID) \(#line) kirino相手からのメッセージ")
                // 左寄りに表示
                VStack(alignment: .leading) {
                    Text(message)
                        .padding(8)
                        .background(Color.green)
                        .cornerRadius(6)
                        .foregroundColor(Color.white)
                    // 相手のユーザー名とdateを表示
                    HStack {
                        Text(user)
                        Text(date.text)
                            .font(.callout)
                    }// HStack
                }// VStack
                Spacer()
            }// if else
        }// HStack
    }// body
}// MessageRow

