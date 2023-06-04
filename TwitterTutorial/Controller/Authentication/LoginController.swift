//
//  LoginController.swift
//  TwitterTutorial
//
//  Created by Harshit Bhargava  on 04/06/23.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    func configureUI(){
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stack.axis = .vertical
        view.addSubview(stack)
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.anchor(top: logoImageView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(dontHaveLoginButton)
        dontHaveLoginButton.anchor(left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,paddingLeft: 40,paddingBottom: 16,paddingRight: 40)
        dontHaveLoginButton.centerX(inView: view)
        
        
    }
    private let logoImageView:UIImageView={
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "TwitterLogo")
        return iv
    }()
    
    
    private lazy var emailContainerView = {
        let image = UIImage(named: "ic_mail_outline_white_2x-1")
        let tF = Utilities().textField(withPlaceholder: "Email")
        let view  = Utilities().inputContainerView(withImage: image!,textField: tF)
        return view
    }()
    
    private lazy var passwordContainerView = {
        let image = UIImage(named: "ic_lock_outline_white_2x")
        let tF = Utilities().textField(withPlaceholder: "Password")
        tF.isSecureTextEntry = true
        let view  = Utilities().inputContainerView(withImage: image!,textField : tF)
        return view
        
    }()
    
    private let loginButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveLoginButton:UIButton = {
        let button = Utilities().attributedFunction(firstPart: "Don't have account? ", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    @objc func loginButtonAction(){
        print("login")
    }
    
    @objc func handleShowSignUp(){
        navigationController?.pushViewController(RegistrationController(), animated: true)
    }

}
