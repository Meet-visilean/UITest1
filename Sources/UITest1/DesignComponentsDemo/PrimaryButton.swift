//
//  PrimaryButton.swift
//  DesignComponentsDemo
//
//  Created by Dhruvit Kachhiya on 11/05/23.
//

import UIKit

public class PrimaryButton: UIButton {
    
    // MARK: - Properties
    var textStyle: TextStyle = .primaryButton {
        didSet {
            configureUI()
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            self.textStyle = isEnabled ? .primaryButton : .primaryButtonDisabled
        }
    }
    
    private var cornerRadius: CGFloat = 10
    
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
    }
    
}
