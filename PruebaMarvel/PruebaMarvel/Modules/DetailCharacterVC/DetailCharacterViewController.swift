//
//  DetailCharacterViewController.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import UIKit

protocol DetailCharacterViewPresenterInterface: class {
    func reloadData()
}

class DetailCharacterViewController: BaseViewController<DetailCharacterPresenterProtocolOutput>, ReuseIdentifierInterfaceViewController{
    
    @IBOutlet weak var myDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.loadDetailCharacter()
        self.presenter?.loadDetailSeries()
        
        self.myDetailTableView.delegate = self
        self.myDetailTableView.dataSource = self
        
        self.myDetailTableView.register(UINib(nibName: HeaderDetailCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: HeaderDetailCell.defaultReuseIdentifier)
        self.myDetailTableView.register(UINib(nibName: SeriesTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: SeriesTableViewCell.defaultReuseIdentifier)
        self.myDetailTableView.register(UINib(nibName: SeriesTableCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: SeriesTableCell.defaultReuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
}

extension DetailCharacterViewController: DetailCharacterViewPresenterInterface {
    internal func reloadData() {
        self.myDetailTableView.reloadData()
    }
    
}

extension DetailCharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return self.presenter?.getArrayItemComics() ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: HeaderDetailCell.defaultReuseIdentifier, for: indexPath) as! HeaderDetailCell
            self.presenter?.getHeaderInfoOfRow { (resultHeader) in
                if let resultHeaderDes = resultHeader {
                    cell.setInfoHeaderView(data: resultHeaderDes)
                }
            }
            return cell
        case 1:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: SeriesTableViewCell.defaultReuseIdentifier, for: indexPath) as! SeriesTableViewCell
            self.presenter?.getInfoSeries { (resultSeries) in
                if let resultSeriesDes = resultSeries {
                    cell.setArraySeries(data: resultSeriesDes)
                }
            }
            return cell
        default:
            let cell = myDetailTableView.dequeueReusableCell(withIdentifier: SeriesTableCell.defaultReuseIdentifier, for: indexPath) as! SeriesTableCell
            self.presenter?.getInfoComic(index: indexPath.row) { (result) in
                cell.setInfo(data: result)
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 220
        case 1:
            return 280
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 220
        case 1:
            return 280
        default:
            return UITableView.automaticDimension
        }
    }
}
