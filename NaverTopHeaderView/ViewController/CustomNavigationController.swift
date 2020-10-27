//
//  CustomNavigationController.swift
//  NaverTopHeaderView
//
//  Created by hyunsu on 2020/10/27.
//
import UIKit

class CustomNavigationController : UINavigationController {
    init() {
        super.init(rootViewController: NaverViewController())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(rootViewController: NaverViewController())
        self.view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.title = "네이버웹툰"
        self.navigationBar.tintColor = .black
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationBar.barTintColor = .white
        self.navigationBar.isTranslucent = true
    }
}
