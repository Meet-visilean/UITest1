//
//  CheckBoxView.swift
//  DesignComponentsDemo
//
//  Created by VisiLean Admin on 05/09/23.
//

import UIKit

protocol CheckBoxSelectionDelegate: AnyObject {
    func didSelectCheckBox(indexes: [Int])
}

extension CheckBoxSelectionDelegate {
    func calculateCheckBoxViewHeight(height: CGFloat) {}
}

class CheckBoxView: UIView {
    
    var selectedIndexes = [Int]()
    var allowMultipleSelection = true
    
    var delegate: CheckBoxSelectionDelegate?
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 15
        return view
    }()
    
    private var radioViews = [CheckBox]()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func set(_ options: [String]) {
        radioViews.removeAll()
        stackView.removeAllArrangedSubviews()
        
        for (index, text) in options.enumerated() {
            let radioView: CheckBox = {
                let view = CheckBox()
                view.tag = index
                view.title = text
                view.addTarget(self, action: #selector(checkBoxSelected(_:)), for: .valueChanged)
                return view
            }()
            stackView.addArrangedSubview(radioView)
            radioViews.append(radioView)
        }
    }
    
    @objc private func checkBoxSelected(_ sender: CheckBox) {
        if allowMultipleSelection {
            if let selectedIndex = selectedIndexes.firstIndex(of: sender.tag) {
                selectedIndexes.remove(at: selectedIndex)
            } else {
                selectedIndexes.append(sender.tag)
            }
        } else {
            selectedIndexes.removeAll()
            selectedIndexes.append(sender.tag)
        }
        
        radioViews.forEach {
            if let _ = selectedIndexes.firstIndex(of: $0.tag) {
                $0.select(true)
            } else {
                $0.select(false)
            }
        }
        
        self.delegate?.didSelectCheckBox(indexes: selectedIndexes)
    }
    
}
