//
//  CharacterCollectionViewCell.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import UIKit
import Kingfisher

protocol CharacterCollectionViewCellProtocol {
    func setupCell(data: ResultCharacter?)
}

class CharacterCollectionViewCell: UICollectionViewCell, ReuseIdentifierProtocol, CharacterCollectionViewCellProtocol {
    
    // MARK: - IBOutlets
    @IBOutlet weak var myImagePoster: UIImageView!
    @IBOutlet weak var myCharacter: UILabel?
    @IBOutlet weak var myPlaceHolder: UIImageView!
    @IBOutlet weak var myDegradado: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    private func setupView() {
        self.myImagePoster.layer.cornerRadius = 10
        self.myImagePoster.layer.shadowColor = UIColor.black.cgColor
        self.myImagePoster.layer.shadowOffset = CGSize(width: CGFloat(10), height: CGFloat(10))
        
        self.myPlaceHolder.layer.cornerRadius = 10
        self.myPlaceHolder.layer.shadowColor = UIColor.black.cgColor
        self.myPlaceHolder.layer.shadowOffset = CGSize(width: CGFloat(10), height: CGFloat(10))
        
        self.myDegradado.layer.cornerRadius = 10
        self.myDegradado.layer.shadowColor = UIColor.black.cgColor
        self.myDegradado.layer.shadowOffset = CGSize(width: CGFloat(10), height: CGFloat(10))
    }
    
    internal func setupCell(data: ResultCharacter?) {
        guard let dataDes = data else { return }
        self.myCharacter?.text = dataDes.name
        self.myImagePoster.kf.setImage(with: ImageResource(downloadURL: (data?.thumbnail?.pathURL)!),
                                       placeholder: UIImage(named: "img-loading"),
                                       options: [
                                        .scaleFactor(UIScreen.main.scale),
                                        .transition(.fade(1)),
                                        .cacheOriginalImage
                                       ],
                                       completionHandler: nil)
    }
}
