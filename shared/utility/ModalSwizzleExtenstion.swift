//
//  ModalSwizzleExtenstion.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import UIKit

@objc public extension UIStoryboard {
    func instantiateViewControllerWithoutiOS13Cards(withIdentifier identifier: String) -> UIViewController {
        // this is now the original implementation
        let viewController = instantiateViewControllerWithoutiOS13Cards(withIdentifier: identifier)

        if viewController.modalPresentationStyle == .pageSheet || viewController.modalPresentationStyle == .automatic {
            viewController.modalPresentationStyle = .fullScreen
        }

        return viewController
    }

    class func swizzleInstantiate() {
        let originalSelector = #selector(instantiateViewController(withIdentifier:))
        let swizzledSelector = #selector(instantiateViewControllerWithoutiOS13Cards(withIdentifier:))

        let originalMethod = class_getInstanceMethod(self, originalSelector)!
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)!

        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}

@objc public extension UIViewController {
    func presentWithoutiOS13Cards(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if viewControllerToPresent.modalPresentationStyle == .pageSheet || viewControllerToPresent.modalPresentationStyle == .automatic {
            viewControllerToPresent.modalPresentationStyle = .fullScreen
        }

        self.presentWithoutiOS13Cards(viewControllerToPresent, animated: flag, completion: completion)
    }

    class func swizzlePresent() {
        let originalSelector = #selector(present(_:animated:completion:))
        let swizzledSelector = #selector(presentWithoutiOS13Cards(_:animated:completion:))

        let originalMethod = class_getInstanceMethod(self, originalSelector)!
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)!

        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
