//
//  ResultViewController.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/07.
//

import UIKit

class ResultViewController: UIViewController {
    
    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var backButton: UIButton!

    @IBOutlet var character: UIImageView!
    
    var email: String = ""
    
    private func bindText() {
        self.emailLabel.text = "\(email) 님\n 환영합니다."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        bindText()
        setStyle()
        // Do any additional setup after loading the view.
    }
    
    func setStyle() {
        setBackButton()
        setEmailLabel()
        setCharacter()
    }
    
    func setBackButton() {
        backButton.backgroundColor = .systemYellow
        backButton.titleLabel?.textColor = .black
        backButton.layer.cornerRadius = 5
    }
    
    func setEmailLabel() {
        emailLabel.font = .systemFont(ofSize: 20)
        emailLabel.numberOfLines = 0
        emailLabel.setLineSpacing(spacing: 3)
        emailLabel.textAlignment = .center
        emailLabel.layer.borderColor = UIColor.systemYellow.cgColor
        emailLabel.layer.borderWidth = 2
        emailLabel.layer.cornerRadius = 5
    }
    
    func setCharacter() {
        character.image = UIImage(named: "chunsik")
    }
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
