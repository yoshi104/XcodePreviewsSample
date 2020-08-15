//
//  Preview.swift
//  XcodePreviewsSample
//
//  Created by Yoshiyuki Kato on 2020/08/13.
//  Copyright © 2020 Yoshiyuki Kato. All rights reserved.
//

import SwiftUI
import UIKit

struct Wrapper: UIViewRepresentable {
    typealias UIViewType = CustomView
    let inputs: [CustomView.Input]
    
    init(inputs:[CustomView.Input]) {
        self.inputs = inputs
    }
    
    func makeUIView(context: Context) -> CustomView {
        CustomView()
    }
    
    func updateUIView(_ uiView: CustomView, context: Context) {
        inputs.forEach {
            uiView.apply(input: $0)
        }
    }
}

struct CustomViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            Wrapper(inputs: [
                .setBackgroundColor(color: .orange),
                .setLabelText(text: "hoge")])
            .previewDisplayName("customView_1")
            
            Wrapper(inputs: [
                .setBackgroundColor(color: .red),
                .setLabelText(text: "fuga")])
            .previewDisplayName("customView_2")
            
        }
    }
}
