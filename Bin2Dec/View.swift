import UIKit
import SnapKit

final class View: UIView {
    private let binaryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite um número binário"
        textField.borderStyle = .line

        return textField
    }()

    private let decimalLabel: UILabel = {
        let label = UILabel()
        label.text = "Texto de Teste"
        label.textAlignment = .center

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
            $0.centerY.equalTo(self)
            $0.left.equalTo(self).offset(16)
            $0.right.equalTo(self).offset(-16)
        }
        
        decimalLabel.snp.makeConstraints {
            $0.bottomMargin.equalTo(binaryTextField).offset(40)
            $0.left.equalTo(self).offset(16)
            $0.right.equalTo(self).offset(-16)
        }
    }

    private func addActions() {
        binaryTextField.delegate = self
    }
}

extension View: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.endEditing(true)
    }
}
