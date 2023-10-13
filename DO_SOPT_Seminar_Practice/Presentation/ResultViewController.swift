//
//  ResultViewController.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/07.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var backButton: UIButton!

    @IBOutlet var character: UIImageView!
    
    var email: String = ""
    
    // 이전 뷰컨에서 받아온 정보 적용
    private func bindText() {
        self.emailLabel.text = "\(email) 님\n 환영합니다."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        bindText()
        setStyle()
    }
    
    // UI 컴포넌트 설정
    private func setStyle() {
        setBackButton()
        setEmailLabel()
        setCharacter()
    }
    
    private func setBackButton() {
        backButton.backgroundColor = .systemYellow
        backButton.titleLabel?.textColor = .black
        backButton.layer.cornerRadius = 5
    }
    
    private func setEmailLabel() {
        emailLabel.font = .systemFont(ofSize: 20)
        emailLabel.numberOfLines = 0
        emailLabel.setLineSpacing(spacing: 3)
        emailLabel.textAlignment = .center
        emailLabel.layer.borderColor = UIColor.systemYellow.cgColor
        emailLabel.layer.borderWidth = 2
        emailLabel.layer.cornerRadius = 5
    }
    
    private func setCharacter() {
        character.image = UIImage(named: "chunsik")
    }
    
    // backButton 눌렀을 때
    @IBAction func backButtonTap(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(email: self.email)
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.email])
    }
}
