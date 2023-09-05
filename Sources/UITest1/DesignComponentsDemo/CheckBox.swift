//
//  CheckBox.swift
//  DesignComponentsDemo
//
//  Created by VisiLean Admin on 05/09/23.
//

import UIKit

class CheckBox: UIControl {
    
    private var textStyle: TextStyle = .checkBox
    
    private var image: UIImage? = UIImage(named: "checkBox")
    private var selectedImage: UIImage? = UIImage(named: "checkBox_selected")
    
    var title: String = "" {
        didSet {
            setTitle()
        }
    }
    
    var isOn: Bool = false {
        didSet {
            updateState()
        }
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        setupUI()
        updateState()
    }
    
    private func setupUI() {
        imageView.tintColor = textStyle.color
        titleLabel.textColor = textStyle.color
        
        titleLabel.font = textStyle.font
    }
    
    private func setTitle() {
        titleLabel.text = title
    }
    
    private func updateState() {
        imageView.image = (isOn ? selectedImage : image)
    }
    
    func select(_ select: Bool) {
        isOn = select
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        sendActions(for: .valueChanged)
        // isOn.toggle()
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return bounds.inset(by: UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)).contains(point)
    }
    
}
