//
//  MainTabBarController.swift
//  TwitterTutorial
//
//  Created by Harshit Bhargava  on 04/06/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        configureUI()
    }

    
    func configureViewControllers(){
        let feed = FeedController()
        let nav1 = templateNavigationController(image: "home_unselected", rootViewController: feed)
        let explore = ExploreController()
        let nav2 = templateNavigationController(image: "search_unselected", rootViewController: explore)
        let notification = NotificationController()
        let nav3 = templateNavigationController(image: "like_unselected", rootViewController: notification)
        let conversation = ConversationController()
        let nav4 = templateNavigationController(image: "ic_mail_outline_white_2x-1", rootViewController: conversation)
        
        viewControllers = [nav1,nav2,nav3,nav4]
        
    }
    
    func templateNavigationController(image: String,rootViewController:UIViewController)->UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = UIImage(named: image)
        nav.navigationBar.barTintColor = .white
        return nav
    }
    func configureUI(){
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
    }
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func actionButtonTapped(){
        print("button tapped")
    }

}
