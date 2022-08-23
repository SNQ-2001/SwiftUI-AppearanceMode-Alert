//
//  AppearanceModeApp.swift
//  AppearanceMode
//
//  Created by 宮本大新 on 2022/08/23.
//

import SwiftUI

@main
struct AppearanceModeApp: App {
    @StateObject var contentViewModel = ContentViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(contentViewModel: contentViewModel)
                .setColorScheme(ContentViewModel.SelectColorScheme(rawValue: contentViewModel.selectColorScheme) ?? .systemMode)
        }
    }
}
