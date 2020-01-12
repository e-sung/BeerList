//
//  BeerListViewController.swift
//  BeerList
//
//  Created by 류성두 on 2020/01/12.
//  Copyright © 2020 Sungdoo. All rights reserved.
//

import UIKit
import RxSwift
import ModelKit

class BeerListViewController: UITableViewController {

    var disposeBag = DisposeBag()
    var beerFetcher = SDBeerFetcher()
    var beerListDataSource = BeerListDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = beerListDataSource
        tableView.prefetchDataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchBeers(for: 1)
    }

    func fetchBeers(for page: Int) {
        let beerFetchTask = beerFetcher.fetchBeers(page: page).observeOn(MainScheduler.instance).share()
        beerFetchTask.subscribe(onNext: { [weak self] beers in
            guard beers.count > 0 else { return }
            self?.beerListDataSource.items.append(contentsOf: beers)
            self?.tableView.reloadData()
        }, onError: { [weak self] error in
            let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            self?.present(alertController, animated: true, completion: nil)
        })
        .disposed(by: disposeBag)
    }
}

extension BeerListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let items = beerListDataSource.items
        let page = (items.count / 25) + 1
        if indexPaths.contains(where: { $0.row == items.count - 1}) {
            fetchBeers(for: page)
        }
        indexPaths.forEach({
            let cell = tableView.cellForRow(at: $0) as? BeerCell
            let beer = items[$0.row]
            cell?.update(with: beer)
        })
    }
}
