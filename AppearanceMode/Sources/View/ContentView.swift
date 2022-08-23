//
//  ContentView.swift
//  AppearanceMode
//
//  Created by 宮本大新 on 2022/08/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contentViewModel: ContentViewModel
    var body: some View {
        Button("外観モード設定") {
            contentViewModel.setColorSchemeAlert(selectColorScheme: $contentViewModel.selectColorScheme)
        }
    }
}
