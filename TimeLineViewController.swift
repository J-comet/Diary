//
//  TimeLineViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/08/02.
//

import UIKit

/*
 1. 프로토콜 (부하직원): UICollectionViewDelegate, UICollectionViewDataSource
 2. 컬렉션뷰와 부하직원 연결 : delegate = self (타입으로서 프로토콜 사용)
 3. 컬렉션뷰 아웃렛
 */
class TimeLineViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let identifier = "TimeLineViewController"

    @IBOutlet var todayCollectionView: UICollectionView!
    @IBOutlet var bestCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        
        bestCollectionView.delegate = self
        bestCollectionView.dataSource = self
        
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        todayCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        bestCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        configureTodayCollectionViewLayout()
        configureBestCollectionViewLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == todayCollectionView ? 3 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell
        else { return UICollectionViewCell() }
        
        if collectionView == todayCollectionView {
            cell.contentsLabel.text = "\(indexPath.item)"
            cell.backgroundColor = .gray
        } else {
            cell.contentsLabel.text = "\(indexPath.item)"
            cell.backgroundColor = [.green, .yellow, .red, .blue, .gray, .lightGray].randomElement()!
        }
        return cell
    }
    
    func configureTodayCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        todayCollectionView.collectionViewLayout = layout
    }
    
    func configureBestCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 300, height: 250)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 00)
        bestCollectionView.collectionViewLayout = layout
        
        // default false
        // 디바이스 가로 기준으로만 페이징 됨 따라서 아이템 너비가 고정일 때는 원하는 동작 X
        bestCollectionView.isPagingEnabled = true
    }
}
