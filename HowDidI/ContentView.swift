import SwiftUI

struct ContentView: View {
    init() {
        // Customizing Tab Bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray6
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().tintColor = UIColor.blue
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            LibraryView()
                .tabItem {
                    Image(systemName: "book.fill")
                }
            
            PostView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        // Search bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            Text("Search...")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        // List of applications
                        VStack(alignment: .leading) {
                            ApplicationView(name: "yale", school: "To Yale", logo: "yale_logo")
                            ApplicationView(name: "harvard", school: "To Harvard", logo: "harvard_logo")
                        }
                        .padding()
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct LibraryView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Library")
                    .font(.largeTitle)
                    .padding(.top)
                
                ScrollView {
                    HStack {
                        Image("HarvardLogo")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Image("YaleLogo")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Image("UCBLogo")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Image("UCSDLogo")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }
                .padding()
            }
        }
    }
}

struct PostView: View {
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title...", text: .constant(""))
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextEditor(text: .constant("Text..."))
                    .frame(height: 200)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Button(action: {}) {
                    VStack {
                        Image(systemName: "plus")
                            .font(.system(size: 40))
                        Text("Upload File")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                }
                
                Button(action: {}) {
                    Text("Post")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding(.top)
            .navigationBarHidden(true)
        }
    }
}

struct ChatView: View {
    var body: some View {
        NavigationView {
            List {
                ChatRowView()
                ChatRowView()
                ChatRowView()
            }
            .navigationBarTitle("Chat")
        }
    }
}

struct ChatRowView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text("Name")
                Text("balabalabalabal")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("6/20/24")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical)
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // User Avatar
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.top, 40)
                
                // Username
                Text("Username")
                    .font(.title)
                    .fontWeight(.bold)
                
                // User Bio
                Text("This is a brief bio about the user. It can be a few lines long and give an overview of who they are.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Settings List
                List {
                    NavigationLink(destination: AccountSettingsView()) {
                        HStack {
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.blue)
                            Text("Account Settings")
                        }
                    }
                    
                    NavigationLink(destination: NotificationSettingsView()) {
                        HStack {
                            Image(systemName: "bell")
                                .foregroundColor(.blue)
                            Text("Notification Settings")
                        }
                    }
                    
                    NavigationLink(destination: PrivacySettingsView()) {
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.blue)
                            Text("Privacy Settings")
                        }
                    }
                    
                    NavigationLink(destination: HelpSupportView()) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.blue)
                            Text("Help & Support")
                        }
                    }
                    
                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Image(systemName: "info.circle")
                                .foregroundColor(.blue)
                            Text("About")
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 20)
                
                Spacer()
            }
            .navigationBarTitle("Profile", displayMode: .inline)
        }
        
    }
}

struct AccountSettingsView: View {
    var body: some View {
        Text("Account Settings Page")
            .font(.largeTitle)
    }
}

struct NotificationSettingsView: View {
    var body: some View {
        Text("Notification Settings Page")
            .font(.largeTitle)
    }
}

struct PrivacySettingsView: View {
    var body: some View {
        Text("Privacy Settings Page")
            .font(.largeTitle)
    }
}

struct HelpSupportView: View {
    var body: some View {
        Text("Help & Support Page")
            .font(.largeTitle)
    }
}

struct AboutView: View {
    var body: some View {
        Text("About Page")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
