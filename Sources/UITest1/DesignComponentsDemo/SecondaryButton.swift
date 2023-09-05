//
//  SecondaryButton.swift
//  DesignComponentsDemo
//
//  Created by Dhruvit Kachhiya on 29/05/23.
//

import UIKit

public class SecondaryButton: UIButton {
    
    // MARK: - Properties
    var textStyle: TextStyle = .secondaryButton {
        didSet {
            configureUI()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            self.textStyle = isEnabled ? .secondaryButton : .secondaryButtonDisabled
        }
    }
    
    private var cornerRadius: CGFloat = 10
    private var borderColor: UIColor = .neutral_1_5
    private var borderWidth: CGFloat = 1
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    private func initialize() {
        configureUI()
    }
    
    private func configureUI() {
        self.setTitleColor(textStyle.color, for: .normal)
        // self.titleLabel?.font = textStyle.font
        self.backgroundColor = textStyle.backgroundColor
        
        if self.cornerRadius > 0 {
            self.layer.cornerRadius = self.cornerRadius
            self.clipsToBounds = true
        }
        
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
    }
    
}
