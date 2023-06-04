//
//  ConversationController.swift
//  TwitterTutorial
//
//  Created by Harshit Bhargava  on 04/06/23.
//

import UIKit

class ConversationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }
}
