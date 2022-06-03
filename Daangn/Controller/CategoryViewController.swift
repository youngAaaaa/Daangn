//
//  CategoryViewController.swift
//  Daangn
//
//  Created by macbook air on 2022/06/01.
//

//import UIKit
//
//class CategoryViewController: UIViewController {
//    
//    var postingVC: PostingViewController?
//    let categoryCellList = ProductCategory.allCases
//
//    @IBAction func tapBackButton(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
//    }
//    
//    @IBOutlet weak var categoryTableView: UITableView!
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        postingVC?.postCategoryLebel.text = categoryCellList[indexPath.row].rawValue
//        postingVC?.category = categoryCellList[indexPath.row]
//        navigationController?.popViewController(animated: true)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        categoryTableView.delegate = self
//        categoryTableView.dataSource = self
//        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categorycell")
//        
//    }
//    
//}

//extension CategoryViewController: UITableViewDelegate, UITableViewDataSource{
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categoryCellList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell", for: indexPath) as? CategoryTableViewCell else{
//            return UITableViewCell()
//        }
//
//        cell.cellUpdate(categoryCellList[indexPath.row])
//
//        //
//
//        return cell
//
//    }
//
//}
