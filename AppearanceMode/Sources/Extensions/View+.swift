//
//  View+.swift
//  AppearanceMode
//
//  Created by 宮本大新 on 2022/08/23.
//

import SwiftUI

// MARK: setColorScheme
// 外観モードをユーザーに設定してもらう
//
// system: システムの外観モードに従う
// darkMode: ダークモード
// lightMode: ライトモード
extension View {
    @ViewBuilder
    func setColorScheme(_ setting: ContentViewModel.SelectColorScheme) -> some View {
        switch setting {
        case .systemMode:
            self.preferredColorScheme(.none)
        case .darkMode:
            self.preferredColorScheme(.dark)
        case .lightMode:
            self.preferredColorScheme(.light)
        }
    }
}
