//
//  ApplicationView.swift
//  HowDidI
//
//  Created by Wang Emily on 8/24/24.
//

import Foundation
import SwiftUI
import PDFKit
import AVKit

struct ApplicationView: View {
    let name: String
    let school: String
    let logo: String
    
    var body: some View {
        NavigationLink(destination: ApplicationDetailView(name: name, school: school, logo: logo)) {
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
}

struct ApplicationDetailView: View {
    let name: String
    let school: String
    let logo: String
    
    var body: some View {
        PagingScrollView {
            VStack(spacing: 0) {
                ResumeView(name: name, school: school, logo: logo)
                    .frame(height: UIScreen.main.bounds.height * 0.835)
                
                AdviceView(name: name, school: school, logo: logo)
                    .frame(height: UIScreen.main.bounds.height * 0.835)

                SOPView(name: name, school: school, logo: logo)
                    .frame(height: UIScreen.main.bounds.height * 0.835)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarBackButtonHidden(true)
        .padding(.top, 0)
    }
}

struct ResumeView: View {
    let name: String
    let school: String
    let logo: String
    
    // Declare the state variables
    @State private var selectedPDF: String = ""
    @State private var isImageFullScreen = false
    @State private var scale: CGFloat = 1.0
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                // Title and logo at the top
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(school)
                            .font(.title)
                            .fontWeight(.bold)
                        Text("GradSchool/")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    Text("Resume/CV")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                        .background(Color(hex: "1CAD9F"))
                        .cornerRadius(18)
                        .padding(.leading, 8)
                    Spacer()
                    Image(logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 0)

                // PDF Viewer with Dots Indicator Below Comment
                VStack(spacing: 0) {
                    TabView {
                        VStack(spacing: 0) {
                            PDFViewer(pdfName: "yale_resume_1", scale: $scale, offset: $offset)
                                .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.width * 0.93 * 1.3)
                                .onTapGesture {
                                    withAnimation {
                                        selectedPDF = "yale_resume_1"
                                        isImageFullScreen.toggle()
                                    }
                                }
                            CommentView()
                            Spacer().frame(height: 40)
                        }
                        .tag(0)

                        VStack(spacing: 0) {
                            PDFViewer(pdfName: "yale_resume_2", scale: $scale, offset: $offset)
                                .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.width * 0.93 * 1.3)
                                .onTapGesture {
                                    withAnimation {
                                        selectedPDF = "yale_resume_2"
                                        isImageFullScreen.toggle()
                                    }
                                }
                            CommentView()
                            Spacer().frame(height: 40)
                        }
                        .tag(1)

                        VStack(spacing: 0) {
                            PDFViewer(pdfName: "yale_resume_3", scale: $scale, offset: $offset)
                                .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.width * 0.93 * 1.3)
                                .onTapGesture {
                                    withAnimation {
                                        selectedPDF = "yale_resume_3"
                                        isImageFullScreen.toggle()
                                    }
                                }
                            CommentView()
                            Spacer().frame(height: 40)
                        }
                        .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Dot indicator below comments
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 1.65)
                .padding(.top, 0)
                .padding(.bottom, 0)
            }
            .padding(.top, 5)

            // Full-Screen PDF View
            if isImageFullScreen {
                Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                PDFViewer(pdfName: selectedPDF, scale: $scale, offset: $offset)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color.black)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                self.scale = value
                            }
                            .onEnded { _ in
                                // Optionally, you can reset the scale here if needed
                                // self.scale = 1.0
                            }
                            .simultaneously(
                                with: DragGesture()
                                    .onChanged { gesture in
                                        self.offset = gesture.translation
                                    }
                                    .onEnded { _ in
                                        self.offset = CGSize.zero
                                    }
                            )
                    )

                // Exit Full-Screen Button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isImageFullScreen.toggle()
                            }
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CommentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Comment Title
            Text("Comment")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 7)
                .background(Color(hex: "1CAD9F"))
                .cornerRadius(18)
                .padding(.leading, 5)
                .padding(.top, 0)
            // Comment Text
            Text("Be specific! And never go over stuff casually! Be specific! And never go over stuff casually! Be specific! And never go over stuff casually!")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.leading, 5)
        }
        .padding(.top, 10)
    }
}

struct AdviceView: View {
    let name: String
    let school: String
    let logo: String
    @State private var isMediaFullScreen = false
    @State private var selectedMedia: String = ""
    @State private var isVideo: Bool = false
    @State private var scale: CGFloat = 1.0
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                // Title and logo at the top
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(school)
                            .font(.title)
                            .fontWeight(.bold)
                        Text("GradSchool/")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    Text("Advice")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(Color(hex: "2C88D9"))
                        .cornerRadius(18)
                        .padding(.leading, 5)
                        .lineLimit(1)
                    Spacer()
                    Image(logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 60)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 0)

                // Question and Answers
                VStack(spacing: 0) {
                    TabView {
                        VStack(alignment: .leading, spacing: 10) {
                            // Video Player replacing the Image
                            if let url = Bundle.main.url(forResource: "yale_video", withExtension: "mp4") {
                                VideoPlayer(player: AVPlayer(url: url))
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width * 0.9)
                                    .cornerRadius(10)
                                    .padding(.top, 15)
                                    .padding(.bottom, 5)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedMedia = "yale_video"
                                            isVideo = true
                                            isMediaFullScreen.toggle()
                                        }
                                    }
                            } else {
                                Text("Video not found")
                                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.5)
                                    .background(Color.gray)
                                    .cornerRadius(10)
                                    .padding(.top, 15)
                                    .padding(.bottom, 5)
                            }

                            // Question at the bottom
                            Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                                .font(.headline)
                                .padding(.bottom, 3)
                            // Pushes the content to the top
                            Spacer()
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.horizontal, 15)
                        .tag(0)

                        VStack(alignment: .leading, spacing: 10) {
                            // Question at the top
                            Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                                .font(.headline)
                                .padding(.top, 15)
                                .padding(.bottom, 5)

                            // Image with pinch-to-zoom functionality
                            Image("img")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width * 0.9)
                                .cornerRadius(10)
                                .padding(.bottom, 3)
                                .onTapGesture {
                                    withAnimation {
                                        selectedMedia = "img"
                                        isVideo = false
                                        isMediaFullScreen.toggle()
                                    }
                                }

                            // Additional content
                            Text("Quidam alli sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in Verbo, quicquid non suis actibus nostris. Non sunt in nostra potestate corpore bona fama imperii, denique quod non sunt actus.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .italic()
                            // Pushes the content to the top
                            Spacer()
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.horizontal, 15)
                        .tag(1)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            // Question1
                            Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                                .font(.headline)
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                            // Answer1
                            Text("Quidam alli sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in Verbo, quicquid non suis")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .italic()
                            
                            // Question2
                            Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                                .font(.headline)
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                            // Answer2
                            Text("Quidam alli sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in Verbo, quicquid non suis")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .italic()
                            
                            // Question3
                            Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                                .font(.headline)
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                            // Answer3
                            Text("Quidam alli sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in Verbo, quicquid non suis")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .italic()
                            // Pushes the content to the top
                            Spacer()
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.horizontal, 15)
                        .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    // Dot indicator below comments
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 1.65)
                .padding(.top, 0)
                .padding(.bottom, 0)
            }
            .padding(.top, 5)
            
            // Full-Screen Media View
            if isMediaFullScreen {
                Color.black.opacity(0.8)
                    .edgesIgnoringSafeArea(.all) // Covers the entire screen, including the nav bar and status bar

                ZStack {
                    if isVideo {
                        // AVPlayer instance
                        let player = AVPlayer(url: Bundle.main.url(forResource: selectedMedia, withExtension: "mp4")!)

                        // Display video in full screen
                        VideoPlayer(player: player)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .onAppear {
                                player.play() // Start playing the video
                            }

                    } else {
                        // Display image in full screen with pinch-to-zoom
                        Image(selectedMedia)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(scale)
                            .offset(x: offset.width, y: offset.height)
                            .gesture(
                                MagnificationGesture()
                                    .onChanged { value in
                                        self.scale = value
                                    }
                                    .onEnded { _ in
                                        // Optionally, you can reset the scale here if needed
                                        // self.scale = 1.0
                                    }
                                    .simultaneously(
                                        with: DragGesture()
                                            .onChanged { gesture in
                                                self.offset = gesture.translation
                                            }
                                            .onEnded { _ in
                                                self.offset = CGSize.zero
                                            }
                                    )
                            )
                    }

                    // Exit Full-Screen Button
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    isMediaFullScreen.toggle()
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct VideoPlayerView: UIViewRepresentable {
    let videoName: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        // Locate the video file
        guard let path = Bundle.main.path(forResource: videoName, ofType: "mp4") else {
            print("Video not found")
            return view
        }

        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspect
        playerLayer.frame = view.bounds
        playerLayer.masksToBounds = true
        view.layer.addSublayer(playerLayer)

        player.play()

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        if let playerLayer = uiView.layer.sublayers?.first as? AVPlayerLayer {
            playerLayer.frame = uiView.bounds
        }
    }
}

// Page Control (Custom Implementation or System One)
struct PageControl: View {
    var currentPage: Int
    var numberOfPages: Int

    var body: some View {
        HStack(spacing: 8) {
//            ForEach(0..<numberOfPages) { index in
//                Circle()
//                    .fill(index == currentPage ? Color.primary : Color.secondary.opacity(0.5))
//                    .frame(width: 8, height: 8)
//            }
        }
    }
}

struct SOPView: View {
    let name: String
    let school: String
    let logo: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title and logo at the top
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(school)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("GradSchool/")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                Text("Statement of Purpose")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Color(hex: "207868"))
                    .cornerRadius(18)
                    .padding(.leading, 5)
                    .lineLimit(1)
                Spacer()
                Image(logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 0)

            // Question and Answers
            VStack(spacing: 0) {
                TabView {
                    VStack(alignment: .leading, spacing: 10) {
                        // Question at the top
                        Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                            .font(.headline)
                            .padding(.top, 15)
                            .padding(.bottom, 10)

                        // Additional content
                        Text("Quidam alfi sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in Verbo, quicquid non suis actibus nostris. Non sunt in nostra potestate corpore bona fama imperiil, denique quod non sunt actus.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Text("Et omnia in potestate nostra esse natura liber, libera, libere valeant; sed illis non est in nostra potestate sunt infirmi, servilis, licet, lex pertinet.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Text("Tenete ergo quod si servitus quae natura liber, et aliena tua tunc impeditur. Dolebis, et turbabuntur, et invenietis, cum culpa tam dis hominibusque. Quod si tbi tantum sit propria et aliena quale sit, nemo unquam vel invitum te continebis.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Text("raeterea, ex culpa non invenies unum aut non accusatis unum. Et nihil inuitam. Nemo nocere tibi erit, et non inimicos, et ne illa laederentur.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Text("Tanta petere igitur, ne sineres memini fieri etiam aliquam inclinationem ad consequendum minima.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Text("Instead, oportet omnino quieti de rebus dialecticis differam, et ad cetera munera.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()

                        Spacer() // Pushes the content to the top
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.horizontal, 15)
                    .tag(0)

                    VStack(alignment: .leading, spacing: 10) {
                        // Question at the top
                        Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                            .font(.headline)
                            .padding(.top, 15)
                            .padding(.bottom, 10)

                        // Additional content
                        Text("Quidam alfi sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in Verbo, quicquid non suis actibus nostris. Non sunt in nostra potestate corpore bona fama imperiil, denique quod non sunt actus.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Spacer() // Pushes the content to the top
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.horizontal, 15)
                    .tag(1)

                    VStack(alignment: .leading, spacing: 10) {
                        // Question at the top
                        Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                            .font(.headline)
                            .padding(.top, 15)
                            .padding(.bottom, 10)

                        // Additional content
                        Text("Quidam alfi sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in Verbo, quicquid non suis actibus nostris. Non sunt in nostra potestate corpore bona fama imperiil, denique quod non sunt actus.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Text("Et omnia in potestate nostra esse natura liber, libera, libere valeant; sed illis non est in nostra potestate sunt infirmi, servilis, licet, lex pertinet.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Text("Tenete ergo quod si servitus quae natura liber, et aliena tua tunc impeditur. Dolebis, et turbabuntur, et invenietis, cum culpa tam dis hominibusque. Quod si tbi tantum sit propria et aliena quale sit, nemo unquam vel invitum te continebis.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Text("raeterea, ex culpa non invenies unum aut non accusatis unum. Et nihil inuitam. Nemo nocere tibi erit, et non inimicos, et ne illa laederentur.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .italic()
                        Spacer() // Pushes the content to the top
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.horizontal, 15)
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Dot indicator below comments
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 1.65) // Adjust height to accommodate comments and spacing
            .padding(.top, 0)
            .padding(.bottom, 0)
        }
        .padding(.top, 5)
    }
}

struct PDFViewer: UIViewRepresentable {
    let pdfName: String
    @Binding var scale: CGFloat
    @Binding var offset: CGSize

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        if let path = Bundle.main.path(forResource: pdfName, ofType: "pdf"),
           let pdfDocument = PDFDocument(url: URL(fileURLWithPath: path)) {
            pdfView.document = pdfDocument
        }
        pdfView.backgroundColor = .clear // transparent background
        pdfView.isOpaque = false
        pdfView.autoScales = true
        
        // Disable scrolling up and down
        pdfView.displayMode = .singlePage
        pdfView.displaysAsBook = false
        
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        // Apply the scale and offset
        pdfView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: offset.width, y: offset.height)
    }
}

// Scrolling up and down
struct PagingScrollView<Content: View>: UIViewControllerRepresentable {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let hostingController = UIHostingController(rootView: content)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .clear // Ensure no extra background
        
        scrollView.addSubview(hostingController.view)
        viewController.view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor),
            
            hostingController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostingController.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            hostingController.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 2.83) // Adjust height for 3 pages
            hostingController.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 2.505) // Adjust height for 3 pages
        ])
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No update needed for this static content example
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: PagingScrollView
        
        init(parent: PagingScrollView) {
            self.parent = parent
        }
    }
}
