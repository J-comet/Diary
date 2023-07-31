//
//  DetailViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    // Pass Data 1. 데이터를 받을 공간(프로퍼티) 생성
    var contents: String = "빈 곳"

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        
        // Pass Data 3. 전달 받은 값 표현하기
        print(contents)
        resultLabel.text = contents
        resultLabel.textColor = .white
        resultLabel.numberOfLines = 0
    }
    
    @IBAction func deleteBarButtonClicked(_ sender: UIBarButtonItem) {
        // 이전단계
        navigationController?.popViewController(animated: true)
        
        // 중간의 다른 컨트롤러로 바로 이동
//        navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        
        // 부모로 바로 이동
//        navigationController?.popToRootViewController(animated: true)
    }
    
}
