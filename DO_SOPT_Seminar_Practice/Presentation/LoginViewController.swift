//
//  ViewController.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/07.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginCheckButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var joinLabel: UILabel!
    @IBOutlet var accoutLabel: UILabel!
    @IBOutlet var findPasswordLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    private var idText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
    }
    
    // 다음뷰로 넘어가면 기존 뷰 초기화 설정
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        idTextField.text = ""
        passwordTextField.text = ""
        idTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    // UI 컴포넌트 설정
    private func setStyle() {
        setDescriptionLabel()
        setIdTextField()
        setPasswordTextField()
        setLoginCheckButton()
        setLoginButton()
        setJoinLabel()
        setAccoutLabel()
        setFindPasswordLabel()
    }
    
    private func setDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 33)
    }
    
    private func setIdTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: idTextField.frame.size.height + 3, width: idTextField.frame.width - 3, height: 1)
        border.backgroundColor = UIColor.systemGray3.cgColor
        idTextField.layer.addSublayer((border))
        idTextField.textAlignment = .left
        idTextField.textColor = UIColor.black
        idTextField.placeholder = "카카오메일 아이디, 이메일, 전화번호"
        idTextField.font = .systemFont(ofSize: 17)
        idTextField.clearButtonMode = .whileEditing // clearButton
    }
    
    private func setPasswordTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: passwordTextField.frame.size.height + 3, width: passwordTextField.frame.width - 3, height: 1)
        border.backgroundColor = UIColor.systemGray3.cgColor
        passwordTextField.layer.addSublayer((border))
        passwordTextField.textAlignment = .left
        passwordTextField.textColor = UIColor.black
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.font = .systemFont(ofSize: 17)
        passwordTextField.clearButtonMode = .whileEditing // clearButton
        passwordTextField.isSecureTextEntry = true // 비밀번호 숨김
    }
    
    private func setLoginCheckButton() {
        loginCheckButton.backgroundColor = .systemYellow
        loginCheckButton.layer.cornerRadius = 11
        // 이미지 크기 줄여서 사용
        let imageSize = CGSize(width: 17, height: 17)
        let resizedImage = UIImage(named: "checkMark")?.resize(targetSize: imageSize)
        loginCheckButton.setImage(resizedImage, for: .normal)
    }
    
    private func setLoginButton() {
        loginButton.backgroundColor = .systemYellow
        loginButton.titleLabel?.textColor = .black
        loginButton.layer.cornerRadius = 5
    }
    
    private func setJoinLabel() {
        joinLabel.font = .systemFont(ofSize: 13)
        joinLabel.textColor = .black
    }
    
    private func setAccoutLabel() {
        accoutLabel.font = .systemFont(ofSize: 13)
        accoutLabel.textColor = .black
    }
    
    private func setFindPasswordLabel() {
        findPasswordLabel.font = .systemFont(ofSize: 13)
        findPasswordLabel.textColor = .black
    }
    
    // loginButton 눌렀을 때
    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(idText)\n")
        pushToResultVC()
    }
    
    // 이메일 입력할 때
    @IBAction func didLoginTextFieldEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    // 다음뷰컨으로 push
    private func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.email = idText
        resultVC.delegate = self
        self.navigationController?.pushViewController(resultVC, animated: true)
        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0])")
        }
    }
}

extension LoginViewController: GetDataProtocol {
    func getLoginData(email: String) {
        print("받아온 email : \(email)")
    }
}

