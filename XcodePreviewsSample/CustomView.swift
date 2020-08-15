//
//  CustomView.swift
//  XcodePreviewsSample
//
//  Created by Yoshiyuki Kato on 2020/08/13.
//  Copyright © 2020 Yoshiyuki Kato. All rights reserved.
//

import UIKit

protocol InputAppliable {
    associatedtype Input
    func apply(input: Input)
}

class CustomView: UIView, InputAppliable {
    
    @IBOutlet weak var label: UILabel!
    
    enum Input {
        case setBackgroundColor(color: UIColor)
        case setLabelText(text: String)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        self.addSubview(view)
    }
    
    func apply(input: Input) {
        switch input {
        case .setBackgroundColor(let color):
            label.backgroundColor = color
        case .setLabelText(let text):
            label.text = text
        }
    }
}
