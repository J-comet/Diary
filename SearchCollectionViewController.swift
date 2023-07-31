//
//  SearchCollectionViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/07/31.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        setCollectionViewLayout()
    }

    // 1. 셀의 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    // 2. 디자인 및 데이터 처리
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        cell.backgroundColor = .systemRed
        cell.contentsLabel.text = "\(indexPath)"
        return cell
    }
    
    // 컬렉션뷰 레이아웃 잡기
    func setCollectionViewLayout() {
        // cell extimated size none 으로 인터페이스 빌더에서 설정할 것
        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
        
        // 비율 계산해서 디바이스 별로 UI 설정
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 4) // 디바이스 너비 계산
        
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)  // 컨텐츠가 잘리지 않고 자연스럽게 표시되도록 여백설정
        layout.minimumLineSpacing = spacing // 최소 셀과 셀 위 아래 간격
        layout.minimumInteritemSpacing = spacing // 최소 셀과 셀 좌우 간격
        
        collectionView.collectionViewLayout = layout  // layout 교체
    }
}
