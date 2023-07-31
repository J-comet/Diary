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
        let count: CGFloat = 3
        let width: CGFloat = UIScreen.main.bounds.width - (spacing * (count + 1)) // 디바이스 너비 계산
        
        layout.itemSize = CGSize(width: width / count, height: width / count)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)  // 컨텐츠가 잘리지 않고 자연스럽게 표시되도록 여백설정
        layout.minimumLineSpacing = spacing         // 셀과셀 위 아래 최소 간격
        layout.minimumInteritemSpacing = spacing    // 셀과셀 좌 우 최소 간격
        
        collectionView.collectionViewLayout = layout  // layout 교체
    }
}
