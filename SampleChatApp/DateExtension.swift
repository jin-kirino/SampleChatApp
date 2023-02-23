//
//  DateExtension.swift
//  SampleChatApp
//
//  Created by 神　樹里乃 on 2022/09/18.
//

import Foundation

// Date型をString型に変換
extension Date {
    var text: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: self)
    }
}
