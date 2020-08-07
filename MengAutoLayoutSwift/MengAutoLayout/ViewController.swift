//
//  ViewController.swift
//  MengAutoLayout
//
//  Created by menglingchao on 2020/8/4.
//  Copyright © 2020 MengLingChao. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    let tableView = UITableView()
    let titles = ["UITextView根据内容自适应高度", "UIScrollView问题", "UIScrollView contentSize根据子视图确定", "UITableViewCell自适应高度", "查看约束", "动画", "安全区域", "基于其他视图宽高比例的约束"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "首页列表"
        
        addTableView()
    }
    // MARK: -
    func addTableView() {
        tableView.estimatedRowHeight = 44
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard indexPath.row < titles.count else {
            return
        }
        var vc: UIViewController?
        
        let title = titles[indexPath.row]
        switch title {
        case "安全区域":
            vc = LCUseSafeAreaViewController()
            break
        default:
            break
        }
        if let aVC = vc {
            navigationController?.pushViewController(aVC, animated: true)
        }
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self)), indexPath.row < titles.count else {
            return UITableViewCell()
        }
        cell.textLabel?.text = titles[indexPath.row]
        
        return cell
    }
}

