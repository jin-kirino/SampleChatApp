//
//  SampleChatAppApp.swift
//  SampleChatApp
//
//  Created by 神　樹里乃 on 2022/09/18.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // アプリケーション起動後のカスタマイズのためのオーバーライドポイント
        // Firebaseの初期化
        FirebaseApp.configure()
        
        return true
    }// application
}// AppDelegate

@main
struct SampleChatAppApp: App {
    // AppDelegateを使えるようにセット
        @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            let _ = print("\(#fileID) \(#line) kirino")
        }// WindowGroup
    }// body
}//SampleChatAppApp
