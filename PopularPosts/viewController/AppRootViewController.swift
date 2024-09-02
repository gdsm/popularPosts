//
//  ViewController.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import UIKit
import DatabaseModule

class AppRootViewController: UIViewController {
    
    private let viewModel = AppRootViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UIStoryboard.swizzleInstantiate()
        UIViewController.swizzlePresent()

        DatabaseProvider.getDatabaseInitialiser().initialize()
        // Do any initialisation setup here before proceeding to further app.
        launchLoginView()
//        launchLoginViewController()
    }
    
    private func launchLoginViewController() {
        if let vc = viewModel.getLoginViewController() {
            self.navigationController?.pushViewController(vc, animated: false)
        } else {
            print("Unable to fetch login ViewController.")
        }
    }
    
    private func launchLoginView() {
        let controller = viewModel.getHostingController()
        self.navigationController?.present(controller, animated: true)
    }
}
