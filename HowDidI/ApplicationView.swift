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
        VStack(alignment: .leading) {
            // Title and logo at the top
            HStack(alignment: .center) {
                VStack() {
                    Text(school)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("GradSchool/")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
            }
            .padding(.horizontal, 25)

            // PDF Viewer
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    TabView {
                        PDFViewer(pdfName: "yale_resume_1")
                            .frame(width: geometry.size.width, height: geometry.size.width * 1.3)
                        
                        PDFViewer(pdfName: "yale_resume_2")
                            .frame(width: geometry.size.width, height: geometry.size.width * 1.3)
                        
                        PDFViewer(pdfName: "yale_resume_3")
                            .frame(width: geometry.size.width, height: geometry.size.width * 1.3)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
                .frame(width: geometry.size.width, height: geometry.size.width * 1.3)
                .alignmentGuide(.top) { _ in 0 } // Aligns the content to the top
            }
        }
        .padding(.top, 10)
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
