//
//  ViewController.swift
//  Daangn
//
//  Created by macbook air on 2022/06/01.
//

import UIKit


class ViewController: UIViewController {
    
    var tableViewModel = PostingProductModel()

    @IBOutlet weak var mainTableView: UITableView!
    
    @IBAction func tapPostingButton(_ sender: Any) {
        
        guard let postingVC = storyboard?.instantiateViewController(withIdentifier: "postingview") as? PostingViewController else {
            return
        }
        
        postingVC.headerStatus = "중고거래 글쓰기"
        
        present(postingVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailview") as? DetailViewController else {
            return
        }
        
        detailVC.getData = tableViewModel.returnPostInfo(indexPath.row)
        detailVC.mainVC = self
        
        tabBarController?.tabBar.isHidden = true
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "maincell")
        
        mainTableView.rowHeight = mainTableView.frame.width / 2.7
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    // 각 섹션에 표시할 행의 개수를 묻는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }
    
    // 특정 인덱스 Row의 Cell에 대한 정보를 넣어 Cell을 반환하는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "maincell", for: indexPath) as? MainTableViewCell
        else{
            return UITableViewCell()
        }
        
        let cellIndex = tableViewModel.returnPostInfo(indexPath.row)
        
        cell.cellUpdate(cellIndex)
        
        return cell
    }
}
