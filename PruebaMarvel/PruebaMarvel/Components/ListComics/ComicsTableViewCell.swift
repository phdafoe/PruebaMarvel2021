//
//  ComicsTableViewCell.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import UIKit
import Kingfisher

class ComicsTableViewCell: BaseTableViewCell<ComicsViewModel>, ReuseIdentifierProtocol {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myNameLBL: UILabel!
    var model: ComicsViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func configure(cellModel: ComicsViewModel) {
        super.configure(cellModel: cellModel)
        self.model = cellModel
        self.myNameLBL.text = cellModel.title
        DispatchQueue.main.async {
            self.myImageView.kf.setImage(with: ImageResource(downloadURL: (cellModel.thumbnail?.pathURL)!),
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
