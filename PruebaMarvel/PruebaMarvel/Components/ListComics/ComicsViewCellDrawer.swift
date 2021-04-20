//
//  ComicsViewCellDrawer.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 20/4/21.
//

import Foundation
import UIKit

class ComicsViewCellDrawer {

    static func cell(model: ComicsViewModel, tableView: UITableView, presenter: Any?) -> UITableViewCell {
        guard let cell = BaseTableViewCell<Any>.createBaseCell(tableView: tableView, cell: ComicsTableViewCell.self, cellName: ComicsTableViewCell.defaultReuseIdentifier, model: model) else {
            return UITableViewCell()
        }
        return cell
    }
    
}
