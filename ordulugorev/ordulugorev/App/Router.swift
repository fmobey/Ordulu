//
//  Router.swift
//  ordulugorev
//
//  Created by Furkan Oğuz on 19.02.2022.
//

import Foundation
import UIKit

class Router {
    
    private var window = UIWindow()
    static var shared: Router = Router()
    
    init() {}
    
    func showHomePage(navigationController: UINavigationController?) {
        let viewController = HomeVC.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        let viewModel = HomeVM()
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension Router {
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
            if animated {
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    let oldState: Bool = UIView.areAnimationsEnabled
                    UIView.setAnimationsEnabled(false)
                    self.window.rootViewController = rootViewController
                    self.window.makeKeyAndVisible()
                    UIView.setAnimationsEnabled(oldState)
                }, completion: { (finished: Bool) -> () in
                    if (completion != nil) {
                        completion!()
                    }
                })
            } else {
                window.rootViewController = rootViewController
            }
        window.makeKeyAndVisible()
        }
    
    func getTopNavigationController() -> UINavigationController? {
        if let vc = UIApplication.getTopViewController() {
            return vc.navigationController
        }
        return nil
    }
}
