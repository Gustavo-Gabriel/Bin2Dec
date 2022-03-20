import UIKit
import SnapKit

final class View: UIView {
    private let binaryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite um número binário"
        textField.borderStyle = .line
        textField.keyboardType = .numberPad

        return textField
    }()

    private let decimalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .systemBackground
        
        buildViewHierarchy()
        setupConstraints()
        addActions()
    }
    
    private func buildViewHierarchy() {
        addSubview(binaryTextField)
        addSubview(decimalLabel)
    }
    
    private func setupConstraints() {
        binaryTextField.snp.makeConstraints {
            $0.top.equalTo(self).offset(40)
            $0.left.equalTo(self).offset(16)
            $0.right.equalTo(self).offset(-16)
        }
        
        decimalLabel.snp.makeConstraints {
            $0.top.equalTo(binaryTextField).offset(40)
            $0.left.equalTo(self).offset(16)
            $0.right.equalTo(self).offset(-16)
        }
    }

    private func addActions() {
        binaryTextField.delegate = self
    }
}

extension View: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let binaryText = binaryTextField.text {
            if binaryText.isBinary {
                if let decimalNumber = Int(binaryText, radix: 2) {
                    decimalLabel.text = "\(binaryText) em decimal é \(decimalNumber)"
                    decimalLabel.textColor = .label
                }
            }
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""

        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        if updatedText.isEmpty {
            decimalLabel.text = ""
            return true
        }

        if !updatedText.isBinary { return false }

        return true
    }
}
