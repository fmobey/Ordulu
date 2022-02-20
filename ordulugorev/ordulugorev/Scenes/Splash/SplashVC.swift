//
//  ViewController.swift
//  ordulugorev
//
//  Created by Furkan Oğuz on 19.02.2022.
//

import UIKit

class SplashVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            Router.shared.showHomePage(navigationController: self.navigationController)
        })
    }


}

