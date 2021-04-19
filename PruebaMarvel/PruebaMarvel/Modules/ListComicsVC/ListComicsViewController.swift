//
//  ListComicsViewController.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import UIKit

protocol ListComicsViewPresenterInterface: class {
    func reloadData()
}

class ListComicsViewController: BaseViewController<ListComicsPresenterProtocolOutput>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comics"
        //self.myTableView.delegate = self
        //self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: ComicsTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: ComicsTableViewCell.defaultReuseIdentifier)
        //self.presenter?.loadComics(with: .comics)

        // Do any additional setup after loading the view.
    }


}

extension ListComicsViewController: ListComicsViewPresenterInterface {
   
    internal func reloadData() {
        self.myTableView.reloadData()
    }
}


//extension ListComicsViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.presenter?.getNumberOfRowCell() ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.myTableView.dequeueReusableCell(withIdentifier: ComicsTableViewCell.defaultReuseIdentifier, for: indexPath) as! ComicsTableViewCell
//        cell.setupCell(data: self.presenter?.getModelDataCell(index: indexPath.row))
//        return cell
//    }
//    
//}
