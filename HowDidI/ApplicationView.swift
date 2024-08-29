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
        VStack(alignment: .leading, spacing: 0) {
            // Title and logo at the top
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(school)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("GradSchool/")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.gray)
                }
                Text("Resume/CV")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
            .padding(.horizontal, 25)
            .padding(.bottom, 0)

            // PDF Viewer
            VStack(spacing: 0) {
                TabView {
                    PDFViewer(pdfName: "yale_resume_1")
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.95 * 1.3)
                    
                    PDFViewer(pdfName: "yale_resume_2")
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.95 * 1.3)
                    
                    PDFViewer(pdfName: "yale_resume_3")
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.95 * 1.3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .padding(.top, 0)
                .padding(.bottom, 0)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 1.3)
            .padding(.top, 0)
            .padding(.bottom, 0)
            
            // Comment
            VStack(alignment: .leading) {
                // Comment Title
                Text("Comment")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 10)
                    .padding(.leading, 8)
            }
            .padding(.top, 0)
            
            Spacer()

        }
        .padding(.top, 5)
        .navigationBarBackButtonHidden(true) // Hides the back button
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
