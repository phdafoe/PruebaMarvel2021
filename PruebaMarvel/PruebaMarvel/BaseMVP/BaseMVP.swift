//
//  BaseMVP.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import Foundation
import UIKit

// MARK: - BaseNavigationController
class BaseNavigationController: UINavigationController {
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

// MARK: - BaseViewController
class BaseViewController <T>: UIViewController {
     var presenter: T?
}

// MARK: - BasePresenter
class BasePresenter <T, U> {
    
    internal var viewController: T?
    internal var router: U?
    
    convenience init (viewController: T, router: U? = nil) {
        self.init()
        self.viewController = viewController
        self.router = router
    }
    
}

// MARK: - BaseRouter
class BaseRouter<P> {
    
    internal var presenter: P?
    internal var viewController: UIViewController?
    
    convenience init(presenter: P? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    internal func show(_ vc: UIViewController){
        if let navigationController = viewController?.navigationController {
            DispatchQueue.main.async {
                navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil) {
        if let navigationController = viewController?.navigationController {
            navigationController.present(viewControllerToPresent, animated: flag, completion: completion)
            return
        }
        viewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}


