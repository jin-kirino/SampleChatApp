//
//  MessageViewModel.swift
//  SampleChatApp
//
//  Created by 神　樹里乃 on 2022/09/18.
//

import Foundation
import FirebaseFirestore

// @Publishedの状態変化を検知してViewに受け渡す
class MessageViewModel: ObservableObject {
    // 配列で管理
    @Published var messages = [messageElement]()
    
    // インスタンス化
    init() {
        // データベースにFirestoreを指定、インスタンス化
        let db = Firestore.firestore()
        print("\(#fileID) \(#line) kirinodbインスタンス化")
        
        // Firestoreに保存されてたデータを読み込む（名前、メッセージ、時間）
        // "message"コレクションに対してアクセスする
        db.collection("messages").addSnapshotListener() { (snap, error) in
            print("\(#fileID) \(#line) kirino")
            // エラー処理
            if let error = error {
                // エラーの原因を表示する
                print(error.localizedDescription)
                return
            }
            // 新規のコレクションとドキュメントを作成
            // スナップショットの取得に成功したらリスナーにアタッチ
            if let snap = snap {
                print("\(#fileID) \(#line) kirino[message]ドキュメントにリスナーをアタッチする")
                // documentChanges:これが最初のスナップショットである場合、すべてのドキュメントが Added changes としてリストに含まれることになります。
                // このfor文で保存されてるメッセージをFirestoreから読み込む
                for i in snap.documentChanges {
                    print("\(#fileID) \(#line) kirino1つのコールバック受け取り")
                    // typeメソッド、発生した変更の種類（追加、変更、削除）
                    // クエリに合致する新規のドキュメントが追加された時、
                    if i.type == .added {
                        print("\(#fileID) \(#line) kirinoキーを使ってコレクションに追加")
                        // キーを使って値を取得する
                        let name = i.document.get("name") as! String
                        let message = i.document.get("message") as! String
                        let createdAt = i.document.get("createAt", serverTimestampBehavior: .estimate) as! Timestamp
                        let createDate = createdAt.dateValue()
                        let id = i.document.documentID
                        
                        // 配列messagesに上の値を追加する
                        self.messages.append(messageElement(id: id, name: name, message: message, createAt: createDate))
                        print("\(#fileID) \(#line) kirino構造体に追加して情報を継承")
                    }// if i.type
                }// for i in
                // sort日付順に並べ替えする
                self.messages.sort { before, after in
                    return before.createAt < after.createAt ? true : false
                    
                }// sort
                print("\(#fileID) \(#line) kirinosort日付順並べ替え")
            }// if let
        }// de.collection
    }// init()
    
    // メッセージを追加するメソッド
    func addMessage(message: String, user: String) {
        let data = [
            "message": message,
            "name": user,
            "createAt": FieldValue.serverTimestamp(),
        // キーはString型、値はString型とData型だからAny型
        ] as [String : Any]

        let db = Firestore.firestore()
        print("\(#fileID) \(#line) kirinoメッセージ追加のdb初期化")
        
        // dbにコレクションを追加する
        db.collection("messages").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }// if let
            print("\(#fileID) \(#line) kirinoFirestoreにメッセージ、名前、時間の追加成功")
        }// db.collection
    }// addMessage
}// MessageViewModel
