//
//  MessageView.swift
//  SampleChatApp
//
//  Created by 神　樹里乃 on 2022/09/18.
//

import SwiftUI

// Chat画面
struct MessageView: View {
    // ユーザー名
    var name = ""
    // MessageViewModelのデータを参照
    @ObservedObject var messageVM = MessageViewModel()
    // chatの入力メッセージを管理
    @State var typeMessage = ""

    var body: some View {
        // chatを表示
        VStack {
            List(messageVM.messages, id: \.id) { i in
                let _ = print("\(#fileID) \(#line) kirino送信済みのメッセージをListに表示")
                if i.name == self.name {
                    MessageRow(message: i.message, isMyMessage: true, user: i.name, date: i.createAt)
                } else {
                    MessageRow(message: i.message, isMyMessage: false, user: i.name, date: i.createAt)
                }// if-else
            }// List.navigationBarTitle("Chats", displayMode: .inline)
            HStack {
                TextField("Message", text: $typeMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // 送信ボタン
                Button(action: {
                    // メッセージ追加メソッド発動
                    self.messageVM.addMessage(message: self.typeMessage, user: self.name)
                    // TextFieldを空欄に設定
                    self.typeMessage = ""
                    print("\(#fileID) \(#line) kirino送信ボタンタップ")
                }) {
                    // 上の矢印のマーク
                    Image(systemName: "arrow.up.circle.fill")
                }// Button
            }// Hstack
        }// VStack
        .padding()
    }// body
}// MessageView
