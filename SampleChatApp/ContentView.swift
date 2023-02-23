//
//  ContentView.swift
//  SampleChatApp
//
//  Created by 神　樹里乃 on 2022/09/18.
//

import SwiftUI

// ユーザー名を入力する画面
struct ContentView: View {
    // ログインする名前を管理
    @State var name = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // 背景オレンジ
                Color.orange
                
                VStack {
                    // 黒い人間の画像
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.top, 12)
                    // 入力する欄
                    TextField("Name ", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    // 入力されたらJoinボタンが表示される（空欄時は非表示）
                    if name != "" {
                        let _ = print("\(#fileID) \(#line) kirino名前入力された")
                        // chat画面のユーザー名に受け渡す
                        NavigationLink(destination: MessageView(name: name)) {
                            HStack {
                                Text("join")
                                // タップしたらMessageViewが表示される
                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }// HStack
                        }// NavigationLink
                        .frame(width: 100, height: 54)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(27)
                        .padding(.bottom, 15)
                    }// if
                }// VStack
                .background(Color.white)
                .cornerRadius(20)
                .padding()
            }// ZStack
            .edgesIgnoringSafeArea(.all)
        }// NavigationView
        // 画面が横にスワイプされる
        .animation(.default, value: name != "")
    }// body
}// ContentView
