//
//  SettingTableViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/08/01.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case cow, snack, pig
    
    var mainOptions: String {
        // get 만 사용중일 때는 get 생략가능
//        get {
            switch self {
            case .cow: return "소 전용"
            case .snack: return "과자 전용"
            case .pig: return "돼지 전용"
            }
//        }
    }
    
    var subOptions: [String] {
        switch self {
        case .cow:
            return ["곱창","막창","대창"]
        case .snack:
            return ["고구마깡", "감자깡", "바나나킥"]
        case .pig:
            return ["삼겹살", "항정살", "가브리살"]
        }
    }
}

class SettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].subOptions.count
//        if section == 0 {
//            return first.count
//        } else if section == 1 {
//            return second.count
//        } else {
//            return third.count
//        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
       
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOptions[indexPath.row]
        
        cell.textLabel?.textColor = .blue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOptions
    }
}
