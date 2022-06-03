//
//  Product.swift
//  Daangn
//
//  Created by macbook air on 2022/06/01.
//

import Foundation

struct PostingProduct {
    let writer: User
    //var category: ProductCategory
    var title: String
    var content: String
    var price: Int?
    var image: String = "기본이미지"
    var identifier: Int
}

class PostingProductModel {
    private var storage: [PostingProduct] = []
    
    // 저장 데이터
    
    // 유저정보 넣으려고 가져온 변수
    private let userModel: UserModel = UserModel()
    
    init() {
        storage = [
            PostingProduct(writer: userModel.returnUserInfo("데이"), title: "아이폰XR 판매합니다", content: "O텐에서 구매한 홍콩판 아이폰XR 입니다. \n 기능 작동 다 잘됩니다!", price: 250000, image: "아이폰XR", identifier: 0),
            PostingProduct(writer: userModel.returnUserInfo("벨라왕"), title: "장인가구 거실장", content: "장인가구에서 구매했습니다. \n 큰 찍힘 없이 사용했습니다. \n 주차장까지 옮기는 거 도와드릴게요", price: 50000, image: "장인가구티비장", identifier: 1),
            PostingProduct(writer: userModel.returnUserInfo("수로"), title: "닌텐도 드퀘빌2 팝니다", content: "닌텐도용 드퀘빌2 팝니다. \n 챗주세용", price: 45000, image: "닌텐도드래곤어쩌구", identifier: 2),
            PostingProduct(writer: userModel.returnUserInfo("마하"), title: "갤럭시탭 S6", content: "사용량 많지 않고, 흠집 1도 없습니다!! \n 배터리상태 100입니다.", price: 460000, image: "갤럭시탭", identifier: 3),
            PostingProduct(writer: userModel.returnUserInfo("구씨"), title: "아이폰 3gs 32GB", content: "한국에 정발한 최초의 아이폰입니다. 기능 모두 정상작동하구요 \n 깨지거나 부서진 곳 없습니다.", price: 130000, image: "아이폰3gs", identifier: 4),
            PostingProduct(writer: userModel.returnUserInfo("기루"), title: "빈티지 인스 판매합니다!", content: "랜덤으로 판매하구요 \n 사진에 나온 인스 섞어서 드려요!", price: 2000, image: "빈티지인스", identifier: 5),
            PostingProduct(writer: userModel.returnUserInfo("내다내"), title: "포켓몬 카드", content: "총 3장 있고 상태도 A급 입니다~~!!", price: 25000, image: "포켓몬카드", identifier: 6),
            PostingProduct(writer: userModel.returnUserInfo("해뜰날"), title: "애플워치se 스그", content: "애플워치se 44mm 스그입니다 \n 배터리 효율 97%로 거의 사용 안했고 보호필름 부착해놨습니다.", price: 300000, image: "애플워치", identifier: 7)
        ]
    }
    
    
    var count: Int {
        return storage.count
    }
    
    
    /// 메인화면에서 SalePost로 데이터를 넘길 때
    /// 메인화면의 tableview index를 가지고 모델에서 데이터를 꺼내오는 함수
    func returnPostInfo(_ index: Int) -> PostingProduct {
        return storage[index]
    }
    
    
    
    /// UserDefault로 데이터 저장하기 위해 배열을 통째로 리턴하는 함수
    func getStorage() -> [PostingProduct] {
        return storage
    }
    
    func posting(writer: String, title: String, content: String, price: Int? = nil){
        
        storage.append(PostingProduct(writer: userModel.returnUserInfo(writer), title: title, content: content, price: price, identifier: storage[storage.count - 1].identifier + 1))
    }
    
    func modifyPost(title: String, content: String, price: Int? = nil, identifier: Int){
        
        let index = storage.firstIndex(where: {
            $0.identifier == identifier
        })
        
        storage[index!].title = title
        storage[index!].content = content
        storage[index!].price = price
    }
    
    func deletePost(_ identifier: Int){
        
        let index = storage.firstIndex(where: {
            $0.identifier == identifier
        })
        
        storage.remove(at: index!)
    }
    
    func Decimal(_ value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
        return result
    }
}


enum ProductCategory: String, CaseIterable {
    case 인기매물 = "인기매물"
    case 중고차 = "중고차"
    case 디지털기기 = "디지털기기"
    case 생활가전 = "생활가전"
    case 가구인테리어 = "가구/인테리어"
    case 유아동 = "유아동"
    case 유아도서 = "유아도서"
    case 생활가공식품 = "생활/가공식품"
    case 스포츠레저 = "스포츠/레저"
    case 여성잡화 = "여성잡화"
    case 여성의류 = "여성의류"
    case 남성의류 = "남성패션/잡화"
    case 게임취미 = "게임/취미"
    case 뷰티미용 = "뷰티/미용"
    case 반려동물용품 = "반려동물용품"
    case 도서티켓음반 = "도서/티켓/음반"
    case 식물 = "식물"
    case 기타중고물품 = "기타 중고물품"
    case 삽니다 = "삽니다"
}
