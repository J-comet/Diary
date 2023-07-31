//
//  ViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/07/31.
//

import UIKit

class AddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        title = "추가 화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(closeButtonClicked)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc
    func closeButtonClicked() {
        // present 로 화면전환시 dismiss 로 제거
        dismiss(animated: true)
        
        // push 로 화면전환시 pop 으로 제거
//        navigationController?.popViewController(animated: true)
    }
    
}

