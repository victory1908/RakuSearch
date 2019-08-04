//
//  SearchVC.swift
//  jichiba-homeassignment
//
//  Created by victory1908 on 28/7/19.
//  Copyright © 2019 Kerdkokaew, Peera | Mai | ECMD. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchVC: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchVM: SearchVM!
    var disposeBag = DisposeBag()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
        bindView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchController.isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func bindView() {
        
        searchController.searchBar.rx.text.orEmpty
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .filter {$0 != ""}
            .bind(to: searchVM.keyword)
            .disposed(by: disposeBag)
        
        searchVM.items.drive(tableView.rx.items(cellIdentifier: "ItemCell", cellType: ItemCell.self)) { (_, item, cell) in
            cell.configItemCell(item: item)
        }.disposed(by: disposeBag)

    }
    
    func setUpSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Rakuten"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

}
