//
//  ViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/07/31.
//

import UIKit

enum TransitionType:String {
    case add = "추가 화면"
    case edit = "수정 화면"
}

// 1. Delegate 프로토콜 추가
// 2. Delegate 연결
// 3. 필요한 메서드 호출해서 구현

class AddViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var mainTextView: UITextView!
    
    var transType : TransitionType = .add
    var contents = ""
    
    let placeHolderText = "텍스트뷰 안에 내용을 입력해주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 텍스트뷰 대리자 연결
        mainTextView.delegate = self
        
        setBackgroundColor()
        
        switch transType {
        case .add:
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "xmark"),
                style: .plain,
                target: self,
                action: #selector(closeButtonClicked)
            )
            navigationItem.leftBarButtonItem?.tintColor = .black
            
            mainTextView.textColor = .lightGray
            mainTextView.text = placeHolderText
        case .edit:
            mainTextView.textColor = .black
            mainTextView.text = contents
        }
        
        title = transType.rawValue
        
    }
    
    // 텍스트뷰에 값이 바뀔 때마다 출력 ( ex) 글자수 체크 )
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        title = "\(textView.text.count) 자"
    }
    
    // TextView 내에 placeholder 같은 기능 만들기
    
    // 편집이 시작될 때 (커서가 시작될 때)
    // 플레이스홀더와 텍스트뷰 글자가 같다면 clear, color
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
        if textView.text == placeHolderText {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    // 편집이 끝날 때 (커서가 없어지는 순간)
    // 사용자가 아무 글자도 안썼으면 플레이스 홀더 글자 보이게 설정
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        if textView.text.isEmpty {
            textView.text = placeHolderText
            textView.textColor = .lightGray
        }
    }
    
    // end TextView 내에 placeholder 같은 기능 만들기
    
    @objc
    func closeButtonClicked() {
        // present 로 화면전환시 dismiss 로 제거
        dismiss(animated: true)
        
        // push 로 화면전환시 pop 으로 제거
//        navigationController?.popViewController(animated: true)
    }
    
}

