//
//  AboutView.swift
//  Oliver Binns
//
//  Created by Oliver Binns on 10/10/2020.
//

import SwiftUI

public struct AboutView: View {
    public init() { }

    public var body: some View {
        VStack(spacing: 16) {
            ProfileView()
            AdaptiveStack(spacing: 16) {
                Link(destination: .twitter) {
                    Card(backgroundColor: Color("Twitter")) {
                        Text("Twitter")
                            .font(.system(Font.TextStyle.largeTitle,
                                          design: .rounded))
                            .fontWeight(.bold)
                    }.foregroundColor(.black)
                }
                Link(destination: .gitHub) {
                    Card(backgroundColor: .white) {
                        Text("GitHub")
                            .font(.system(Font.TextStyle.largeTitle,
                                          design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }.foregroundColor(.white)
                }
                Link(destination: .linkedIn) {
                    Card(backgroundColor: Color("LinkedIn")) {
                        Text("LinkedIn")
                            .font(.system(Font.TextStyle.largeTitle,
                                          design: .rounded))
                            .fontWeight(.bold)
                    }.foregroundColor(.white)
                }
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
