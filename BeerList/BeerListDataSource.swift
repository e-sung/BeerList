//
//  BeerListDataSource.swift
//  BeerList
//
//  Created by 류성두 on 2020/01/12.
//  Copyright © 2020 Sungdoo. All rights reserved.
//

import Foundation
import ModelKit
import UIKit

class BeerListDataSource: NSObject, UITableViewDataSource {
    var items:[Beer] = []
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerCell
        let beer = items[indexPath.row]
        cell.update(with: beer)
        return cell
    }
}
