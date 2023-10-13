//
//  ViewController.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginCheckButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var joinLabel: UILabel!
    @IBOutlet var accoutLabel: UILabel!
    @IBOutlet var findPasswordLabel: UILabel!
    
    private var idText: String = ""
    private var passwordText: String = ""
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setStyle()
    }
    
    func setStyle() {
        setDescriptionLabel()
        setIdTextField()
        setPasswordTextField()
        setLoginCheckButton()
        setLoginButton()
        setJoinLabel()
        setAccoutLabel()
        setFindPasswordLabel()
    }
    
    func setDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 33)
    }
    
    func setIdTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: idTextField.frame.size.height + 3, width: idTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.systemGray3.cgColor
        idTextField.layer.addSublayer((border))
        idTextField.textAlignment = .left
        idTextField.textColor = UIColor.black
        idTextField.placeholder = "카카오메일 아이디, 이메일, 전화번호"
        idTextField.font = .systemFont(ofSize: 17)

    }
    
    func setPasswordTextField() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: passwordTextField.frame.size.height + 3, width: passwordTextField.frame.width, height: 1)
        border.backgroundColor = UIColor.systemGray3.cgColor
        passwordTextField.layer.addSublayer((border))
        passwordTextField.textAlignment = .left
        passwordTextField.textColor = UIColor.black
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.font = .systemFont(ofSize: 17)

    }
    
    func setLoginCheckButton() {
        loginCheckButton.backgroundColor = .systemYellow
        loginCheckButton.layer.cornerRadius = 11
        // 이미지 크기 줄여서 사용
        let imageSize = CGSize(width: 17, height: 17)
        let resizedImage = UIImage(named: "checkMark")?.resize(targetSize: imageSize)
        loginCheckButton.setImage(resizedImage, for: .normal)
    }
    
    func setLoginButton() {
        loginButton.backgroundColor = .systemYellow
        loginButton.titleLabel?.textColor = .black
        loginButton.layer.cornerRadius = 5
    }
    
    func setJoinLabel() {
        joinLabel.font = .systemFont(ofSize: 13)
        joinLabel.textColor = .black
    }
    
    func setAccoutLabel() {
        accoutLabel.font = .systemFont(ofSize: 13)
        accoutLabel.textColor = .black
    }
    
    func setFindPasswordLabel() {
        findPasswordLabel.font = .systemFont(ofSize: 13)
        findPasswordLabel.textColor = .black
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        pushToResultVC()
    }
    
    @IBAction func didLoginTextFieldEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func didPasswordTextFieldEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.email = idText
        resultVC.password = passwordText
        resultVC.delegate = self
        self.navigationController?.pushViewController(resultVC, animated: true)
        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(email: String, password: String) {
        print("받아온 email : \(email), 받아온 password : \(password)")
    }
}

