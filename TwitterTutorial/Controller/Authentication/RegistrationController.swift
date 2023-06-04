//
//  RegistrationController.swift
//  TwitterTutorial
//
//  Created by Harshit Bhargava  on 04/06/23.
//

import UIKit

class RegistrationController: UIViewController {
    
    
    private let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        // Do any additional setup after loading the view.
    }
    func configureUI(){
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(photoPlusImageView)
        photoPlusImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        photoPlusImageView.setDimensions(width: 128, height: 128)
        
        view.addSubview(alreadyHaveLoginButton)
        alreadyHaveLoginButton.anchor(left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,paddingLeft: 40,paddingBottom: 16,paddingRight: 40)
        alreadyHaveLoginButton.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,fullNameContainerView,userNameContainerView,signupButton])
        stack.axis = .vertical
        view.addSubview(stack)
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.anchor(top: photoPlusImageView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingLeft: 32,paddingRight: 32)
        
        
    }
    
    private let photoPlusImageView:UIButton={
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleprofiePic), for: .touchUpInside)
        return button
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
    
    private lazy var fullNameContainerView = {
        let image = UIImage(named: "ic_person_outline_white_2x 1")
        let tF = Utilities().textField(withPlaceholder: "Full Name")
        let view  = Utilities().inputContainerView(withImage: image!,textField: tF)
        return view
    }()
    
    private lazy var userNameContainerView = {
        let image = UIImage(named: "ic_person_outline_white_2x")
        let tF = Utilities().textField(withPlaceholder: "User Name")
        let view  = Utilities().inputContainerView(withImage: image!,textField: tF)
        return view
    }()
    
    private let alreadyHaveLoginButton:UIButton = {
        let button = Utilities().attributedFunction(firstPart: "Already have account? ", secondPart: "Sign In")
        button.addTarget(self, action: #selector(handleShowSignIn), for: .touchUpInside)
        return button
    }()
    
    private let signupButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        return button
    }()
    
    @objc func handleShowSignIn(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func  handleprofiePic(){
        present(imagePicker, animated: true)
    }
    @objc func signUpButtonAction(){
        print("signUp Button pressed")
    }

}


extension RegistrationController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else{return}
        photoPlusImageView.layer.cornerRadius = 128 / 2
        photoPlusImageView.layer.masksToBounds = true
        photoPlusImageView.imageView?.contentMode = .scaleAspectFill
        photoPlusImageView.imageView?.clipsToBounds = true
        photoPlusImageView.layer.borderColor = UIColor.white.cgColor
        photoPlusImageView.layer.borderWidth = 3
        self.photoPlusImageView.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        
        
        dismiss(animated: true)
    }
}
