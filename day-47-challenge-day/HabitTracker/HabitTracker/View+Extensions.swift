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
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        
        return self
    }
}
