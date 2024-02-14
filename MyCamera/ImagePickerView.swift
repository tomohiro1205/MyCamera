//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by 木村朋広 on 2024/02/13.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    // UIImagePickerController(写真撮影)が表示されているかを管理
    @Binding var isShowSheet: Bool
    // 撮影した写真を格納する変数
    @Binding var captureImage: UIImage?

    // Coordinatorでコントローラのdelegateを管理
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        // ImagePickerView型の定数を用意
        let parent: ImagePickerView

        // イニシャライザ
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }

        // 撮影が終わった時に呼ばれるdelegateメソッド、必ず必要
        func    imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // UIImagePickerControllerを閉じる。isShowSheetがfalseになる。
            picker.dismiss(animated: true) {
                // 撮影した写真をcaptureImageに保存
                if let originalImage =
                    info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                {
                    self.parent.captureImage = originalImage
                }
            }
        }

        // キャンセルボタンが選択された時に呼ばれるdelegateメソッド、必ず必要
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // sheetを閉じる
            parent.isShowSheet.toggle()
        }
    } // Coordinatorここまで

    // Coordinatorを生成、SwiftUIによってい自動的に呼び出し
    func makeCoordinator() -> Coordinator {
        // Coordinatorクラスのインスタンスを生成
        Coordinator(self)
    }

// viewを生成するときに実行
    func makeUIViewController(context: Context) -> some UIViewController {
        // UIImagePickerControllerのインスタンスを生成
        let myImagePickerController = UIImagePickerController()
        // sourceTypeにcameraを設定
        myImagePickerController.sourceType = .camera
        // delegate設定
        myImagePickerController.delegate = context.coordinator
        // UIImagePickerControllerを返す
        return myImagePickerController
    } // makeUIViewController ここまで

    // Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //処理なし
    } // updateUIViewControllerここまで
} // imagePickerView ここまで



