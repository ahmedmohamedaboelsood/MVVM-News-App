//
//  SplashVC.swift
//  MVVMNewsApp
//
//  Created by 2B on 29/10/2023.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        navigeteToNewsVC()
    }
    
    private func navigeteToNewsVC(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            let viewController = NewsVC()
            self.navigationController?.pushViewControllerWithModalTransition(viewController: viewController)
        }
    }
    
    
}

