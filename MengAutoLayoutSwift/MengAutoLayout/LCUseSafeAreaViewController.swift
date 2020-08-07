//
//  LCUseSafeAreaViewController.swift
//  MengAutoLayout
//
//  Created by menglingchao on 2020/8/4.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

import UIKit

class LCUseSafeAreaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
        addButton()
    }
    // MARK: -
    func addButton() {
        //注意，当前的edgesForExtendedLayout是默认的UIRectEdgeAll，请看看该button的frame
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.purple
        button.setTitleColor(.white, for: .normal)
        button.setTitle("请在刘海屏/非刘海屏上旋转屏幕试试", for: .normal)
        view.addSubview(button)
        button.snp_makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
                make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.left.right.equalToSuperview()
                make.top.equalTo(topLayoutGuide.snp.bottom)
                make.bottom.equalTo(bottomLayoutGuide.snp.top)
            }
        }
    }
}
