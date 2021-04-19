//
//  ListCharactersViewController.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import UIKit

protocol ListCharactersViewPresenterInterface: class {
    func reloadData()
}

class ListCharactersViewController: BaseViewController<ListCharactersPresenterProtocolOutput>, ReuseIdentifierInterfaceViewController {
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Characters"
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(UINib(nibName: CharacterCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CharacterCollectionViewCell.defaultReuseIdentifier)
        self.presenter?.loadCharacters()
    }
    
}

extension ListCharactersViewController: ListCharactersViewPresenterInterface {
   
    internal func reloadData() {
        self.myCollectionView.reloadData()
    }
}

extension ListCharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let cellsForRows = self.presenter?.getNumberOfRowCell() {
            return cellsForRows
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.myCollectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.defaultReuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        if let dataModel = self.presenter?.getModelDataCell(index: indexPath.row) {
            cell.setupCell(data: dataModel)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let dataModel = self.presenter?.getModelDataCell(index: indexPath.row) {
            self.presenter?.showDetailCharacterFromView(data: dataModel)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Helpers().showPostersInCollectionView(myCollectionView)
    }
    
}


