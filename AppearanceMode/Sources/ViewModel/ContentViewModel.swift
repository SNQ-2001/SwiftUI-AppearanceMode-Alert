//
//  ContentViewModel.swift
//  AppearanceMode
//
//  Created by 宮本大新 on 2022/08/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    // 外観モードの設定
    @AppStorage(wrappedValue: 0, "selectColorScheme") public var selectColorScheme
    // 外観モードの選択肢
    public enum SelectColorScheme: Int {
        case systemMode = 0
        case lightMode = 1
        case darkMode = 2
    }
    // 外観モードの変更
    func setColorSchemeAlert(selectColorScheme: Binding<Int>) {
        let alert = UIAlertController(title: "外観モード設定", message: nil, preferredStyle: .alert)

        var systemModeButton = UIAlertAction(title: "システム設定", style: .default) { _ in
            selectColorScheme.wrappedValue = 0
        }
        var lightModeButton = UIAlertAction(title: "ライトモード", style: .default) { _ in
            selectColorScheme.wrappedValue = 1
        }
        var darkModeButton = UIAlertAction(title: "ダークモード", style: .default) { _ in
            selectColorScheme.wrappedValue = 2
        }
        let CancelButton = UIAlertAction(title: NSLocalizedString("キャンセル", comment: ""), style: .cancel) { _ in }

        if (selectColorScheme.wrappedValue == 0) {
            systemModeButton = selectAlertController(action: systemModeButton)
        } else if (selectColorScheme.wrappedValue == 1) {
            lightModeButton = selectAlertController(action: lightModeButton)
        } else{
            darkModeButton = selectAlertController(action: darkModeButton)
        }

        alert.addAction(systemModeButton)
        alert.addAction(lightModeButton)
        alert.addAction(darkModeButton)
        alert.addAction(CancelButton)

        let WindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        WindowScene?.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    // 選択されている項目に画像と色を付ける
    func selectAlertController(action: UIAlertAction) -> UIAlertAction {
        action.setValue(UIImage(named: "check"), forKey: "image")
        action.setValue(UIColor(Color.green), forKey: "imageTintColor")
        action.setValue(UIColor(Color.green), forKey: "titleTextColor")

        return action
    }
}
