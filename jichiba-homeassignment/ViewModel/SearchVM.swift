//
//  SearchVM.swift
//  jichiba-homeassignment
//
//  Created by victory1908 on 28/7/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import RxSwift
import RxRelay
import RxCocoa
class SearchVM {
    
    var items: Driver<[Item]> = Driver.just([])
    var keyword = PublishSubject<String>()
    var page = 0
    
    init () {
        self.items = keyword
                .do(onNext: { items in
                    self.page = self.page + 1
                    
                })
                .flatMap { self.searchItems(keyword: $0, page: self.page)}
                .asDriver(onErrorJustReturn: [])
    }
    
    func searchItems(keyword: String, page: Int) -> Observable<[Item]> {
        return Observable.create({ (observer) -> Disposable in
            let searchRequest = SearchRequest(keyword: keyword, page: page)
            QuickNetworking.request(searchRequest) { (response: SearchResponse?, error) in
                guard let response = response else {
                    return observer.onCompleted()
                }
                if let error = error {
                    observer.onError(error)
                }
                observer.onNext(response.items)
                observer.onCompleted()
            }
            return Disposables.create()
        })
    }
}
