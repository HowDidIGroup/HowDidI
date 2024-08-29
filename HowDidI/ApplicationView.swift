//
//  ApplicationView.swift
//  HowDidI
//
//  Created by Wang Emily on 8/24/24.
//

import Foundation
import SwiftUI
import PDFKit

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
//                ResumeView(name: name, school: school, logo: logo)
//                    .frame(height: UIScreen.main.bounds.height)
//                
//                AdviceView(name: name, school: school, logo: logo)
//                    .frame(height: UIScreen.main.bounds.height)
                
                SOPView(name: name, school: school, logo: logo)
                    .frame(height: UIScreen.main.bounds.height)
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
                        PDFViewer(pdfName: "yale_resume_1")
                            .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.width * 0.93 * 1.3)
                        CommentView()
                        Spacer().frame(height: 40)
                    }
                    .tag(0)

                    VStack(spacing: 0) {
                        PDFViewer(pdfName: "yale_resume_2")
                            .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.width * 0.93 * 1.3)
                        CommentView()
                        Spacer().frame(height: 40)
                    }
                    .tag(1)

                    VStack(spacing: 0) {
                        PDFViewer(pdfName: "yale_resume_3")
                            .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.width * 0.93 * 1.3)
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
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(Color(hex: "1CAD9F"))
                .cornerRadius(18)
                .padding(.leading, 8)
                .padding(.top, 0)
            // Comment Text
            Text("Be specific! And never go over stuff casually! Be specific! And never go over stuff casually! Be specific! And never go over stuff casually!")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.horizontal, 10)
                .padding(.leading, 8)
        }
        .padding(.top, 10)
    }
}

struct AdviceView: View {
    let name: String
    let school: String
    let logo: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title and logo at the top
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("To \(school)")
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
                    .padding(.vertical, 7)
                    .background(Color(hex: "1CAD9F"))
                    .cornerRadius(18)
                    .padding(.leading, 8)
                Spacer()
                Image(logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40) // Adjust the height as per the design
                    .padding(.trailing, 15) // Adjust the spacing
            }
            .padding(.horizontal, 15) // Adjust horizontal padding
            .padding(.bottom, 10) // Adjust bottom padding

            // Central Content Area
            VStack(spacing: 15) {
                Text("What experiences and academic preparation do you have that are relevant to the degree you’re seeking?")
                    .font(.headline)
                    .padding(.horizontal, 15)

                Rectangle() // Placeholder for the media (image/video)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.5)
                    .cornerRadius(10)
                    .overlay(
                        Image(systemName: "play.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                    )

                Text("Quidam alii sunt, et non est in nostra potestate. Quae omnia in nostra sententia, pursuit, cupiditatem, aversatio, ex quibus in Verbo, quicquid non suis actibus nostris.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 15)
            }
            .padding(.vertical, 20)
            .frame(width: UIScreen.main.bounds.width * 0.95)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)

            // Page Indicator
            HStack {
                Spacer()
//                PageControl(currentPage: 0, numberOfPages: 3)
                Spacer()
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
        }
        .padding(.top, 5)
        .background(Color(hex: "F2F2F7")) // Light background color to match the design
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
                            .padding(.top, 10)
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
                            .padding(.top, 10)
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
                    .tag(1)

                    VStack(alignment: .leading, spacing: 10) {
                        // Question at the top
                        Text("What experiences and academic\npreparation do you have that are relevant\nto the degree you're seeking?")
                            .font(.headline)
                            .padding(.top, 10)
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
         pdfView.isUserInteractionEnabled = false
         pdfView.displayBox = .cropBox
        
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        // Update the PDFView if needed
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
            hostingController.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.83) // Adjust height for 3 pages
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
