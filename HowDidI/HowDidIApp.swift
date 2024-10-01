import SwiftUI
import Firebase

@main
struct HowDidIApp: App {
    init() {
        if let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
           let options = FirebaseOptions(contentsOfFile: filePath) {
            FirebaseApp.configure(options: options)
            print("Firebase 已成功配置")
        } else {
            print("GoogleService-Info.plist 文件未找到，Firebase 配置失败")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
