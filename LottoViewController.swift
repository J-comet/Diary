//
//  LottoViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/08/03.
//

import UIKit
import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var drwtNoLabel: UILabel!
    @IBOutlet var drwtDateLabel: UILabel!

    @IBOutlet var contentTextField: UITextField!
    
//    let list = ["영화", "드라마", "애니매이션", "만화", "연극", "뮤지컬"]
    let numList: [Int] = Array(1...1100).reversed()
    
    let pickerView = UIPickerView()
    
    let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Alamofire + SwiftyJson
        // validate = 서버개발자와 논의 후 어떤 statusCode 일 때 성공으로 할지 ex) validate(statusCode: 200...300)
        requestLottoInfo(num: "1079")
        
        // 텍스트필드 눌렀을 때 피커뷰 뜨도록 추가
        contentTextField.text = "1079"
        contentTextField.inputView = pickerView
        contentTextField.tintColor = .clear
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        drwtNoLabel.numberOfLines = 0
    }
    
    private func requestLottoInfo(num: String) {
        AF.request(url+num, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let date = json["drwNoDate"].stringValue
                let drwtNo1 = json["drwtNo1"].intValue
                let drwtNo2 = json["drwtNo2"].intValue
                let drwtNo3 = json["drwtNo3"].intValue
                let drwtNo4 = json["drwtNo4"].intValue
                let drwtNo5 = json["drwtNo5"].intValue
                let drwtNo6 = json["drwtNo6"].intValue
                let bonusNumber = json["bnusNo"].intValue
                
                self.drwtDateLabel.text = date
                
                self.drwtNoLabel.text = "당첨번호\n \(drwtNo1) \(drwtNo2) \(drwtNo3) \(drwtNo4) \(drwtNo5) \(drwtNo6) + 보너스번호 \(bonusNumber)"
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
//        if component == 0 {
//            return list.count
//        } else {
//            return numList.count
//        }
        return numList.count
    }
    
    // 현재 선택되어 있는 피커뷰
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("component = ", component)
        print("didSelectRow = ", row)
        
//        if component == 0 {
//            contentTextField.text = list[row]
//        } else {
//
//            // 숫자 피커뷰
//            contentTextField.text = String(numList[row])
//            requestLottoInfo(num: String(numList[row]))
//        }
        // 숫자 피커뷰
        contentTextField.text = String(numList[row])
        requestLottoInfo(num: String(numList[row]))
    }
    
    // 피커뷰안 컨텐츠 내용 설정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
//        if component == 0 {
//            return list[row]
//        } else {
//            return String(numList[row])
//        }
        return String(numList[row])
    }
    
    
    
}
