    //
//  ViewController.swift
//  Custom-TabBar
//
//  Created by 윤성호 on 08/04/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 타이틀 레이블
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "첫 번째 탭"
        title.textColor = UIColor.red
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        title.sizeToFit()                               // 콘텐츠의 내용에 맞게 레이블 크기 변경
        title.center.x = self.view.frame.width / 2      // 콘텐츠 중앙
        
        self.view.addSubview(title)
        
        
    }
    
    // 터치가 끝났을 때 호출되는 메소드 (화면 전체에서 발생하는 터치 액션을 처리)
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let tabBar = self.tabBarController?.tabBar
//        tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        // 애니메이션 효과를 주기 위한 메소드
        UIView.animate(withDuration: TimeInterval(0.15)){
            
            // 호출될 때마다 점점 투명해졌다가 점점 진해짐
            tabBar?.alpha = (tabBar?.alpha == 0 ? 1 : 0)
            
        }
    }

}

