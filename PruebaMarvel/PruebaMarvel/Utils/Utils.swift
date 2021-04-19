//
//  Uitls.swift
//  Marvel
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/03/2021.
//

import Foundation
import UIKit

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    struct BaseURL {
        let publicApiKey = "96883215ffa72a3c8dfa23e3883f6866"
        let privateApiKey = "9d1a45359c89f37c4e2d5a0ee6d826572624e785"
        let baseAPIURL = "https://gateway.marvel.com/v1/public"
        let urlSession = URLSession.shared
        let jsonDecoder = Utils.jsonDecoder
    }
 
}

class Helpers {

    func showPostersInCollectionView(_ myCollectionView : UICollectionView) -> CGSize{
        let flowLayout = UICollectionViewFlowLayout()
        let cellSpacing = CGFloat(1)
        let leftRightMargin = CGFloat(10)
        let numColumns = CGFloat(2)
        let totalCellSpace = cellSpacing * (numColumns - 1)
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - leftRightMargin - totalCellSpace) / numColumns
        var height = CGFloat(270)
        height = width * height / 180
        flowLayout.itemSize = CGSize(width: width, height: height)
        return flowLayout.itemSize
    }
    
    struct Colores {
        let GRIS_BARRA_NAVEGACION = #colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 1)
        let GRAY_NAV = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        let BLANCO_TEXTO_NAV = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let RED_ICON = #colorLiteral(red: 0.8889052868, green: 0.1445426047, blue: 0.1411617994, alpha: 1)
    }
}


public protocol ReuseIdentifierProtocol : class {
    static var defaultReuseIdentifier : String{get}
}

public protocol ReuseIdentifierInterfaceViewController : class{
    static var defaultReuseIdentifierViewController : String {get}
}

public extension ReuseIdentifierProtocol where Self : UIView {
    static var defaultReuseIdentifier : String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

public extension ReuseIdentifierInterfaceViewController where Self : UIViewController{
    static var defaultReuseIdentifierViewController : String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader : ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var imageCache = _imageCache
    
    func loadImage(whit url: URL) {
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension Date {
    func string(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}


