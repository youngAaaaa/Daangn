//
//  PostingViewController.swift
//  Daangn
//
//  Created by macbook air on 2022/06/01.
//

import UIKit

class PostingViewController: UIViewController {
    
    //var category: ProductCategory?
    var homeVC: ViewController?
    var deatilVC: DetailViewController?
    var headerStatus:String?
    var userName = "데이"
    
    @IBOutlet weak var postTitleTextField: UITextField!
    @IBOutlet weak var postCategoryLabel: UILabel!
    @IBOutlet weak var postPriceTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var postContentTextView: UITextView!
    @IBOutlet weak var headerStatusLabel: UILabel!
    
    
    
    @IBAction func tapCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapPostingButton(_ sender: Any) {
        
        if(self.headerStatus == "중고거래 글쓰기"){
            homeVC?.tableViewModel.posting(writer: userName, title: postTitleTextField.text!, content: postContentTextView.text!, price: Int(postPriceTextField.text ?? "") ?? nil)
        }
        else{
            tabBarController?.tabBar.isHidden = true
            
            homeVC?.tableViewModel.modifyPost(title: postTitleTextField.text!, content: postContentTextView.text!, price: Int(postPriceTextField.text ?? "") ?? nil, identifier: deatilVC!.getData!.identifier)
            
            deatilVC?.updatePost(homeVC!.tableViewModel.returnPostInfo(deatilVC!.getData!.identifier))
        }
        
        homeVC?.mainTableView.reloadData()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerStatusLabel.text = headerStatus!
        
        if (headerStatusLabel.text! == "중고거래 글쓰기") {
            
            postContentTextView.textColor = UIColor.systemGray
            postContentTextView.text = "올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)"
            postContentTextView.delegate = self
            
            postPriceTextField.textColor = UIColor.systemGray
            postPriceTextField.text = "가격 (선택사항)"
            postPriceTextField.delegate = self
            
        } else {
            
            postTitleTextField.text = deatilVC?.postTitleLabel.text
            
            let inModelPrice = deatilVC?.mainVC?.tableViewModel.returnPostInfo((deatilVC?.getData!.identifier)!).price
            postPriceTextField.text = inModelPrice == nil ? "" : String(inModelPrice!)
            postContentTextView.text = deatilVC?.postContentLabel.text
        }
    }
    
}

extension PostingViewController: UITextViewDelegate, UITextFieldDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.textColor == UIColor.systemGray) {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text.isEmpty){
            textView.text = "올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)"
            textView.textColor = UIColor.black
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.textColor == UIColor.systemGray) {
            textField.text = nil
            textField.textColor = UIColor.black
            priceLabel.textColor = UIColor.black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.isEmpty {
            textField.text = "가격 (선택사항)"
            textField.textColor = UIColor.systemGray
            priceLabel.textColor = UIColor.systemGray
        }
    }
}
