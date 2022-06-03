//
//  DetailViewController.swift
//  Daangn
//
//  Created by macbook air on 2022/06/02.
//

import UIKit

class DetailViewController: UIViewController {
    
    var mainVC: ViewController?
    var getData: PostingProduct?
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBG: UIView!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postContentLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var chattingButton: UIButton!
    
    
    @IBAction func tapCloseButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tapMoreButton(_ sender: Any) {
        
        showAlert()
        
        debugPrint("click")
    }
    
    func showAlert(){
        
        let alter = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        // MARK: 게시글 수정
        let modify = UIAlertAction(title: "게시글 수정", style: .default, handler: { (action) in
            
            guard let nvVC = self.storyboard?.instantiateViewController(withIdentifier: "navigationcontroller") as? UINavigationController else {
                return
            }
            
            guard let postingVC = nvVC.viewControllers[0] as? PostingViewController else {
                return
            }
            
            postingVC.headerStatus = "중고거래 글 수정하기"
            
            postingVC.deatilVC = self
            
            postingVC.homeVC = self.mainVC
            
            self.present(nvVC, animated: true, completion: nil)
        })
        
        
        // MARK: 삭제
        let delete = UIAlertAction(title: "삭제", style: .destructive, handler: { (action) in
            self.mainVC?.tableViewModel.deletePost(self.getData!.identifier)
            self.mainVC?.mainTableView.reloadData()
            self.navigationController?.popViewController(animated: true)
            
        })
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alter.addAction(modify)
        alter.addAction(delete)
        alter.addAction(cancel)
        
        self.present(alter, animated: true, completion: nil)
    }
    
    func updatePost(_ data: PostingProduct){
        
        if(data.image == "기본이미지"){
            productBG.isHidden = true
        } else {
            productImage.image = UIImage(named: data.image)
        }
        
        postTitleLabel.text = data.title
        postContentLabel.text = data.content
        //productPriceLabel.text = data.price == nil ? "" : data.price == 0 ? "나눔🧡" : Decimal(data.price!)
        guard let price = data.price else {
            productPriceLabel.text = ""
            return
        }
        if price == 0 {
            productPriceLabel.text = "나눔🧡"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chattingButton.layer.cornerRadius = CGFloat(10)
        
        updatePost(getData!)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
