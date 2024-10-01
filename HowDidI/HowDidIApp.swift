//
//  HowDidIApp.swift
//  HowDidI
//
//  Created by Tongze Mao on 6/10/24.
//

import SwiftUI
import Firebase

@main
struct HowDidIApp: App {
    init() {
        FirebaseApp.configure()

        // 检查 Firebase 是否成功初始化
        if let firebaseApp = FirebaseApp.app() {
            print("Firebase 已成功配置: \(firebaseApp)")
        } else {
            print("Firebase 配置失败")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
