//
//  SeriesCollectionViewCell.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/03/2021.
//

import UIKit
import Kingfisher

protocol SeriesCollectionViewCellProtocol {
    func setupCell(data: ResultSeries?)
}

class SeriesCollectionViewCell: UICollectionViewCell, ReuseIdentifierProtocol, SeriesCollectionViewCellProtocol {
    
    @IBOutlet weak var myCharacter: UILabel?
    @IBOutlet weak var myPlaceHolder: UIImageView!
    @IBOutlet weak var myDegradado: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupView() {
        
        self.myPlaceHolder.layer.cornerRadius = 10
        self.myPlaceHolder.layer.shadowColor = UIColor.black.cgColor
        self.myPlaceHolder.layer.shadowOffset = CGSize(width: CGFloat(10), height: CGFloat(10))
        
        self.myDegradado.layer.cornerRadius = 10
        self.myDegradado.layer.shadowColor = UIColor.black.cgColor
        self.myDegradado.layer.shadowOffset = CGSize(width: CGFloat(10), height: CGFloat(10))
    }
    
    internal func setupCell(data: ResultSeries?) {
        guard let dataDes = data else { return }
        self.myCharacter?.text = dataDes.title
        self.myPlaceHolder.kf.setImage(with: ImageResource(downloadURL: (data?.thumbnail?.pathURL)!),
                                       placeholder: UIImage(named: "placeholder"),
                                       options: [
                                        .scaleFactor(UIScreen.main.scale),
                                        .transition(.fade(1)),
                                        .cacheOriginalImage
                                       ],
                                       completionHandler: nil)
    }

}
