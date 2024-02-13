//
//  ContentView.swift
//  MyCamera
//
//  Created by 木村朋広 on 2024/02/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // スペース追加
            Spacer()
            // 「カメラを起動する」ボタン
            Button {
                // ボタンをタップしたときのアクション
                // カメラが利用可能かチェック
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    print("カメラは利用できます")
                }　else {
                    print("カメラは利用できません")
                }
            } label: {
                // テキスト表示
                Text("カメラを起動する")
                // 横幅いっぱい
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                // 高さ50ポイントを指定
                    .frame(height: 50)
                // 文字列を先端リング指定
                    .multilineTextAlignment(.center)
                // 背景を青色に指定
                    .background(Color.blue)
                // 文字色を白色に指定
                    .foregroundStyle(Color.white)
            } // 「カメラを起動する」ボタンここまで
        } //VStackここまで
    } //bodyここまで
} // contentView ここまで

#Preview {
    ContentView()
}
