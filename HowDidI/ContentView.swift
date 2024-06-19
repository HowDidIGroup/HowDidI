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
                            ApplicationView(school: "To Yale", logo: "YaleLogo")
                            ApplicationView(school: "To Harvard", logo: "HarvardLogo")
                        }
                        .padding()
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct ApplicationView: View {
    let school: String
    let logo: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(school)
                    .font(.headline)
                Spacer()
                Image(logo)
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Text("GradSchool")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("CV, Activities, SoP, and PS...")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Quidam alii sunt, et non est in nostra potestate...")
                .font(.footnote)
                .foregroundColor(.gray)
            HStack {
                Spacer()
                Text("Limit 10")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Divider()
        }
        .padding(.vertical)
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
        Text("Profile Page")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
