//
//  ComicsTableViewCell.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 16/03/2021.
//

import UIKit
import Kingfisher

protocol ComicsTableViewCellProtocol: class {
    func setupCell(data: ResultComics?)
}


class ComicsTableViewCell: UITableViewCell, ReuseIdentifierProtocol {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myNameLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    internal func setupCell(data: ResultComics?) {
        guard let dataDes = data else { return }
        self.myNameLBL.text = dataDes.title
        DispatchQueue.main.async {
            self.myImageView.kf.setImage(with: ImageResource(downloadURL: (data?.thumbnail?.pathURL)!),
                                         placeholder: UIImage(named: "img-loading"),
                                         options: [
                                            .scaleFactor(UIScreen.main.scale),
                                            .transition(.fade(1)),
                                            .cacheOriginalImage
                                         ],
                                         completionHandler: nil)
        }
    }
    
}
