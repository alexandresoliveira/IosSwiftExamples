//
//  ViewController.swift
//  MaterialDesignSwiftIOS
//
//  Created by Desenvolvedor on 08/11/17.
//  Copyright © 2017 alexandreoliveira.eti.br. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func loadTabBar() {
        let tabBar = MDCTabBar(frame: self.view.bounds)
        tabBar.items = [
            UITabBarItem(title: "Tela 1", image: nil, tag: 0),
            UITabBarItem(title: "Tela 2", image: nil, tag: 0)
        ]
        tabBar.itemAppearance = .titles
        tabBar.autoresizingMask = [
            .flexibleWidth
        ]
        tabBar.alignment = .justified
        tabBar.barTintColor = UIColor.blue
        tabBar.sizeToFit()
        tabBar.delegate = self
        self.view.addSubview(tabBar)
    }
}

extension ViewController: MDCTabBarDelegate {
    
    func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        
    }
    
    func tabBar(_ tabBar: MDCTabBar, willSelect item: UITabBarItem) {
        
    }
    
    func tabBar(_ tabBar: MDCTabBar, shouldSelect item: UITabBarItem) -> Bool {
        return true
    }
}

extension ViewController: UIBarPositioningDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return UIBarPosition.bottom
    }
}

