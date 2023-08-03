//
//  LottoViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/08/03.
//

import UIKit

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var contentTextField: UITextField!
    
    let list = ["영화", "드라마", "애니매이션", "만화", "연극", "뮤지컬"]
    let numList: [Int] = Array(1...100).reversed()
    
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 텍스트필드 눌렀을 때 피커뷰 뜨도록 추가
        contentTextField.inputView = pickerView
        contentTextField.tintColor = .clear
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return list.count
        } else {
            return numList.count
        }
    
    }
    
    // 현재 선택되어 있는 피커뷰
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("component = ", component)
        print("didSelectRow = ", row)
        
        if component == 0 {
            contentTextField.text = list[row]
        } else {
            contentTextField.text = String(numList[row])
        }
        
    }
    
    // 피커뷰안 컨텐츠 내용 설정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return list[row]
        } else {
            return String(numList[row])
        }
    
    }
    
    
    
}
