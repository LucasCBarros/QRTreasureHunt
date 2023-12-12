//
//  TabViewController.swift
//  QRTreasureHunt
//
//  Created by Lucas C Barros on 2023-12-10.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        
        self.view.backgroundColor = .yellow
        self.tabBar.tintColor = .brown
        self.tabBar.barTintColor = .orange
        self.tabBar.backgroundColor = .cyan
        self.tabBar.unselectedItemTintColor = .purple
        
        
        self.selectedIndex = 1
        // Do any additional setup after loading the view.
    }
    
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: ViewController())
        let read = self.createNav(with: "Read", and: UIImage(systemName: "clock"), vc: ReadQRViewController())
        let generate = self.createNav(with: "Generate", and: UIImage(systemName: "cloud.snow"), vc: GenerateQRViewController())
        
        self.setViewControllers([home, read, generate], animated: true)
    }

    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.image = image
        nav.tabBarItem.title = title
        nav.viewControllers.first?.navigationItem.title = title + "Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        
        return nav
    }
}
