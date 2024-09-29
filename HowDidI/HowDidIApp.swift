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
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
