//
//  SeriesTableViewCell.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/03/2021.
//

import UIKit

protocol SeriesTableViewCellProtocol: class {
    func setArraySeries(data: [ResultSeries]?)
}


class SeriesTableViewCell: UITableViewCell, ReuseIdentifierProtocol, SeriesTableViewCellProtocol {
    
    var myArraySeries: [ResultSeries] = []
    @IBOutlet weak var myCollectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(UINib(nibName: SeriesCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SeriesCollectionViewCell.defaultReuseIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    internal func setArraySeries(data: [ResultSeries]?) {
        if let dataDes = data {
            self.myArraySeries = dataDes
            self.myCollectionView.reloadData()
        }
    }
    
    
}

extension SeriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.myArraySeries.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.myCollectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.defaultReuseIdentifier, for: indexPath) as! SeriesCollectionViewCell
        cell.setupCell(data: self.myArraySeries[indexPath.row])
        return cell
    }
}
