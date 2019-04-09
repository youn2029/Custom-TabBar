//
//  NewAppDelegate.swift
//  Custom-TabBar
//
//  Created by 윤성호 on 09/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

@UIApplicationMain
class NewAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // 탭 바 컨트롤러를 생성, 배경 : 흰색
        let tbC = UITabBarController()
        tbC.view.backgroundColor = UIColor.white
        
        // 생성된 탭 바 컨트롤러를 루트 뷰 컨트롤러로 등록
        self.window?.rootViewController = tbC
        
        // 각 탭 바 아이템에 연결될 뷰 컨트롤러 객체 생성
        let view1 = ViewController()
        let view2 = SecondViewController()
        let view3 = ThirdViewController()
        
        // 생성된 뷰 컨트롤러 객체들을 탭 바 컨트롤러에 등록
        tbC.setViewControllers([view1, view2, view3], animated: false)
        
        // 개별 탭 바 아이템의 속성 설정
        view1.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        view2.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        view3.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
        
        return true
    }
}
