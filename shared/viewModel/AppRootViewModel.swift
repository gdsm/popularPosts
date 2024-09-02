//
//  AppRootViewModel.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import SwiftUI

final class AppRootViewModel: ObservableObject {
    
    func getHostingController() -> some UIViewController {
        let hostingController = UIHostingController(rootView: LoginView())
        return UINavigationController(rootViewController: hostingController)
    }
    
    func getLoginViewController() -> UIViewController? {
        return UIStoryboard(
            name: "Main",
            bundle: nil)
        .instantiateViewController(
            withIdentifier: LoginViewController.storyboardId
        ) as? LoginViewController
    }
}
