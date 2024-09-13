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
                        
                        // You Might Like Section
                            VStack(alignment: .leading, spacing: 10) {
                                                    Text("You Might Like >")
                                                        .font(.headline)
                                                        .padding(.horizontal)
                                                    
                                                    ScrollView(.horizontal, showsIndicators: false) {
                                                        HStack(spacing: 20) {
                                                            ForEach(recommendedSchools, id: \.self) { school in
                                                                SchoolRecommendationView(school: school)
                                                            }
                                                        }
                                                        .padding(.horizontal)
                                                    }
                                                }
                        
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
            VStack(spacing: 10) {
                HStack(alignment: .center) {
                    // User Avatar
                    ZStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .foregroundColor(.purple)
                    }
                    // Greeting and Username
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Good Afternoon,")
                            .font(.title2)
                        Text("Emilygoodjob")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
                
                Divider()
                
                // Balance
                HStack(spacing: 5) {
                    ZStack {
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .background(Circle().fill(Color(red: 0.15, green: 0.67, blue: 0.65)))
                    }
                    Text("19.92")
                        .font(.title2)
                }
                .padding(.horizontal)
                
                Divider()

                // Settings List
                VStack(spacing: 1) {
                    // Account
                    NavigationLink(destination: AccountView()) {
                        HStack(spacing: 5) {
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.gray)
                                .font(.system(size: 30))
                            Text("Account")
                                .font(.title3)
                                .foregroundColor(.black)
                            Spacer() // Push the content to the left
                        }
                        .background(Color.white)
                    }

                    // Settings
                    NavigationLink(destination: SettingView()) {
                        HStack(spacing: 5) {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 30))
                            Text("Settings")
                                .font(.title3)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.top, 2)
                        .background(Color.white)
                    }

                    // Membership
                    NavigationLink(destination: MembershipView()) {
                        HStack(spacing: 5) {
                            Image(systemName: "person.crop.circle.badge.checkmark")
                                .foregroundColor(.gray)
                                .font(.system(size: 30))
                            Text("Membership")
                                .font(.title3)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.top, 2)
                        .background(Color.white)
                    }
                }
                .padding(.horizontal) // Correctly placed here
                
                Divider()

                VStack(spacing: 10) {
                    // Manuscript Section (Fixed at the top)
                    HStack(alignment: .center, spacing: 10) {
                        Text("Manuscript")
                            .font(.title3)
                            .bold()
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25))
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Scrollable content below
                    ScrollView {
                        VStack(spacing: 10) {
                            // Scrollable list of items
                            HStack(spacing: 10) {
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                            }

                            HStack(spacing: 10) {
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                            }

                            HStack(spacing: 10) {
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                            }
                            
                            HStack(spacing: 10) {
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 115)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                        .padding(.top, 5)
                    }
                }
            }
        }
    }
}

struct AccountView: View {
    var body: some View {
        Text("Account Page")
            .font(.largeTitle)
    }
}

struct SettingView: View {
    var body: some View {
        Text("Setting Page")
            .font(.largeTitle)
    }
}

struct MembershipView: View {
    var body: some View {
        Text("Membership Page")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SchoolRecommendationView: View {
    var school: School

    var body: some View {
        NavigationLink(destination: SchoolDetailView(schoolName: school.name)) {
            VStack {
                Image(school.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                Text(school.name)
                    .font(.caption)
            }
        }
    }
}


struct School: Hashable {
    var name: String
    var logo: String
}

let recommendedSchools = [
    School(name: "Yale", logo: "YaleLogo"),
    School(name: "Harvard", logo: "HarvardLogo"),
    School(name: "UCB", logo: "UCBLogo"),
    School(name: "UCSD", logo: "UCSDLogo")
]


struct SchoolDetailView: View {
    var schoolName: String

    var body: some View {
        Text("Welcome to \(schoolName)!")
            .navigationBarTitle(Text(schoolName), displayMode: .inline)
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
