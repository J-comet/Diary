//
//  DiaryTableViewController.swift
//  Diary
//
//  Created by 장혜성 on 2023/07/31.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var list = ["테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1","테스트3","테스트4테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰, 테이블뷰 셀의 컬러쪽은 적용이안됨
        tableView.backgroundColor = .clear
        setBackgroundColor()
        
        // XIB로 테이블뷰셀을 생성할 경우, 테이블뷰에 사용할 셀을 등록!!
        let nib =  UINib(nibName: DiaryTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DiaryTableViewCell.identifier)
        
        // Dynimic Height 필수 조건
        // 1. automaticDimension
        // 2. label numberOfLines
        // 3. AutoLayout (상하좌우 여백)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func searchBarButtonClicked(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SearchCollectionViewController") as! SearchCollectionViewController
        navigationController?.pushViewController(vc, animated: true)
        //        present(nav, animated: true)
    }
    
    @IBAction func addBarButtonClicked(_ sender: UIBarButtonItem) {
        // 코드로 화면전환하기
        // 인터페이스빌더(스토리보드) ViewController 에 identifier 설정 필수!
        
        // 1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // 2. 스토리보드 파일 내 뷰컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        // 2-1 (옵션). 네비게이션 컨트롤러가 있는 형태(제목)바로 Present 하고 싶은 경우
        // nav 를 사용한다면, present 와 화면 전환 방식도 nav 로 수정 해주어야함.
        let nav = UINavigationController(rootViewController: vc)
        
        // 3. 화면 전환 방식 설정 (애니매이션)
        //        vc.modalTransitionStyle = .crossDissolve        // 모달 애니매이션
        //        vc.modalPresentationStyle = .fullScreen         // 모달 방식
        nav.modalPresentationStyle = .fullScreen
        
        // 4. 화면 띄우기
        present(nav, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier) as? DiaryTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(row: list[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // 2. 스토리보드 파일 내 뷰컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        // 3. 화면 전환 방식 설정 (애니매이션)
        vc.modalTransitionStyle = .coverVertical        // 모달 애니매이션
        vc.modalPresentationStyle = .formSheet          // 모달 방식
        // 4. 화면 띄우기
        //        present(vc, animated: true)
        
        // Pass Data 2. vc 가 가지고 있는 프로퍼티에 데이터 추가
        vc.contents = list[indexPath.row]
        
        // 네비컨트롤러가 붙어있을 떄 오른쪽에서 나오도록 설정 가능
        // 인터페이스빌더(스토리보드)에 네비게이션 컨트롤러가 임베드 되어 있어야만 Push 가 동작!!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // * 시스템 Delete 호출
    // 1. 편집가능한 상태 true 로 설정
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 2. Delete 스타일로 많이 사용됨
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    // Custom 스와이프 - Leading
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let bookmark = UIContextualAction(style: .normal, title: "") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("bookmark")
            success(true)
        }
        bookmark.image = UIImage(systemName: "bookmark")
        bookmark.backgroundColor = .systemCyan
        
        let like = UIContextualAction(style: .normal, title: "") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("like")
            success(true)
        }
        like.image = UIImage(systemName: "heart")
        like.backgroundColor = .systemPink
        return UISwipeActionsConfiguration(actions: [bookmark, like])
    }
    
    // Custom 스와이프 - Trailing
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("delete")
            success(true)
        }
        delete.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
