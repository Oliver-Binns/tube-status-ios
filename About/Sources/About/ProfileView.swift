//
//  ProfileView.swift
//  Oliver Binns
//
//  Created by Oliver Binns on 28/10/2020.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        SafariButton(url: .businessCard) {
            Card(backgroundColor: Color("Oliver")) {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        VStack {
                            AsyncImage(url: .profileImage,
                                       placeholder: { ProgressView() },
                                       image: { Image(uiImage: $0).resizable() })
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Image("Oliver")
                            Text(
                                """
                                iOS Developer
                                London, UK
                                """)
                                .multilineTextAlignment(.leading)
                                .font(.headline)
                        }
                    }
                    Text(
                        // swiftlint:disable line_length
                        """
                        Oliver is an experienced software engineer who mainly focusses on native iOS development in Swift. He has worked on a number of mobile apps, across a range of sectors including travel, healthcare and productivity, for both the general consumer and enterprise markets. Oliver was awarded a scholarship to attend Apple's Worldwide Developer Conference in both 2015 & 16.

                        As well as a deep understanding of the native Apple software development, Oliver has wide-ranging knowledge of Web and wider mobile platforms. He has worked on native (Java, Kotlin) and Unity (C#) applications for Android, and has developed for a range of web-based systems (Angular, PHP, JavaScript, Python).

                        Oliver has an IET accredited master's degree in Computer Science from the University of York. Drawing on this background, he is able to ensure his work has a strong grounding in first principles, while observing best practices from industry. Oliver draws on his deep theoretical knowledge to quickly learn new tools and frameworks.
                        """).multilineTextAlignment(.leading)
                }
            }.foregroundColor(Color(UIColor.systemBackground))
        }
    }
}
