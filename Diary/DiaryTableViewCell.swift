//
//  DiaryTableViewCell.swift
//  Diary
//
//  Created by 장혜성 on 2023/07/31.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    static let identifier = "DiaryTableViewCell"
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var contentLabel: UILabel!
    
    func configureCell(row: String) {
        contentLabel.numberOfLines = 0
        contentLabel.text = row
    }
    
}
