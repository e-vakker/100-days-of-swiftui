//
//  View+Extensions.swift
//  HabitTracker
//
//  Created by Jevgeni Vakker on 25.07.2023.
//

import SwiftUI

extension View {
    /// Sets the text color for a navigation bar title.
    /// - Parameter color: Color the title should be
    ///
    /// Supports both regular and large titles.
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        
        var titleFont = UIFont.preferredFont(forTextStyle: .largeTitle) /// the default large title font
        titleFont = UIFont(
            descriptor:
                titleFont.fontDescriptor
                .withDesign(.rounded)? /// make rounded
                .withSymbolicTraits(.traitBold) /// make bold
            ??
            titleFont.fontDescriptor, /// return the normal title if customization failed
            size: titleFont.pointSize
        )
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor, .font: titleFont]
        
        return self
    }
}
