//
//  AppDelegate.swift
//  Custom-TabBar
//
//  Created by 윤성호 on 08/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 루트 뷰 컨트롤러를 UITabBarController로 캐스팅
        if let tbC = self.window?.rootViewController as? UITabBarController {
            
            // 탭 바 아이템 배열을 가져오기
            if let tbItems = tbC.tabBar.items {
                
                // 탭 바 아이템의 이미지 설정 (원본 이미지를 사용할 경우 / 기본값 : UIImage.ReanderingMode.alwaysTemplate)
                tbItems[0].image = UIImage(named: "designbump@2x")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tbItems[1].image = UIImage(named: "rss@2x")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                tbItems[2].image = UIImage(named: "facebook@2x")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                
                // 탭 바 아이템의 타이틀 설정
                tbItems[0].title = "calendar"
                tbItems[1].title = "file"
                tbItems[2].title = "photo"
                
                // 같은 속성으로 설정하기 위한 반복문
                for tbItem in tbItems {
                    
                    // 탭 바 아이템 전체를 selectedImage 속성 설정
                    tbItem.selectedImage = UIImage(named: "checkmark@2x")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                    
                    // 탭 바 아이템의 타이틀 속성 설정
                    tbItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .disabled)
                    tbItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
                    
                    // 탭 바 아이템의 타이틀 글자크기 설정
                    tbItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], for: .normal)
                }
            }
            
            tbC.tabBar.tintColor = UIColor.white        // 활성화된 탭 바 색상 설정
            
            tbC.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini.png")  // 탭 바의 배경이미지 설정
            
            // 탭 바의 이미지 설정 (신축성 옵션 설정)
//            let image = UIImage(named: "connectivity-bar")?.stretchableImage(withLeftCapWidth: 50, topCapHeight: 0)
//            tbC.tabBar.backgroundImage = image
            
            // 탭 바의 색상 설정
//            tbC.tabBar.barTintColor = UIColor.black
            
            // 이미지를 barTintColor 속성에 UIImage(patternImage:)를 이용하여 설정
//            let image = UIImage(named: "menubar-bg-mini")!
//            tbC.tabBar.barTintColor = UIColor(patternImage: image)
            
            // 탭 바 영역보다 큰 이미지일 경우
//            let image = UIImage(named: "homes_119")?.stretchableImage(withLeftCapWidth: 5, topCapHeight: 0)
//            tbC.tabBar.backgroundImage = image
//            tbC.tabBar.clipsToBounds = true     // 탭 바 영역에서 벗어나는 부분을 잘라내는 속성
            
            
            
            
            
        }
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Custom_TabBar")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

