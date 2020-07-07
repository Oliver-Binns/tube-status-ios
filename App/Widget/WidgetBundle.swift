//
//  WidgetBundle.swift
//  HomescreenExtension
//
//  Created by Oliver Binns on 25/06/2020.
//

import SwiftUI
import WidgetKit

@main
struct TubeWidgets: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        AllLinesWidget()
        SingleLineWidget()
    }
}
