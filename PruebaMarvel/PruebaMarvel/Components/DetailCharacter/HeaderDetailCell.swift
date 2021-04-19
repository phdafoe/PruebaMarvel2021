//
//  HeaderDetailCell.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/03/2021.
//

import UIKit
import Kingfisher

protocol HeaderDetailCellProtocol: class {
    func setInfoHeaderView(data: ResultCharacter)
}

class HeaderDetailCell: UITableViewCell, ReuseIdentifierProtocol, HeaderDetailCellProtocol {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myNameLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    internal func setInfoHeaderView(data: ResultCharacter) {
        self.myNameLBL?.text = data.name
        self.myImage.kf.setImage(with: ImageResource(downloadURL: (data.thumbnail?.pathURL)!),
                                       placeholder: UIImage(named: "img-loading"),
                                       options: [
                                        .scaleFactor(UIScreen.main.scale),
                                        .transition(.fade(1)),
                                        .cacheOriginalImage
                                       ],
                                       completionHandler: nil)
    }
    
}
