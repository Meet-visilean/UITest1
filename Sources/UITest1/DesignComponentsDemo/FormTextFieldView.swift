//
//  FormTextFieldView.swift
//  DesignComponentsDemo
//
//  Created by Dhruvit Kachhiya on 11/05/23.
//

import UIKit

class FormTextFieldView: UIView {
    
    // MARK: - Properties
    private var titleLabel = UILabel()
    private var textField = UITextField()
    
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
    
    func initialize() {
        setUpTitleLabel()
        setUpTextField()
        applyDefaultStyle()
    }
    
    func setUpTitleLabel() {
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: titleLabel, attribute: .trailing, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 24)
        ])
    }
    
    func setUpTextField() {
        self.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: textField, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 12),
            NSLayoutConstraint(item: textField, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: textField, attribute: .trailing, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: textField, attribute: .bottom, multiplier: 1, constant: 8)
        ])
    }
    
    // MARK: - Styling
    func applyDefaultStyle() {
        titleLabel.textColor = .formItemTitle
        titleLabel.numberOfLines = 1
        // titleLabel.font = .formItemTitle
        titleLabel.textAlignment = .left
        
        textField.textColor = .formItemText
        // textField.font = .formItemText
        textField.borderStyle = .roundedRect
    }
    
    func set(titleText: String, textFieldPlaceholder: String) {
        titleLabel.text = titleText
        textField.placeholder = textFieldPlaceholder
    }
    
}
