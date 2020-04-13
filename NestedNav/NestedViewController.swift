//
//  NestedViewController.swift
//  NestedNav
//
//  Created by Pisit W on 20/3/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class NestedViewController: UIViewController {
    
    var rootVC: UIViewController
    weak var rootNavigation: UINavigationController?
    
    // 1
    init(rootNavigation: UINavigationController) {
        guard let vc = rootNavigation.viewControllers.first else {
            fatalError("root has not been initialized")
        }
        self.rootVC = vc
        self.rootNavigation = rootNavigation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2
        let childNavigation = rootNavigation ?? UINavigationController(rootViewController: rootVC)
        childNavigation.willMove(toParent: self)
        addChild(childNavigation)
        childNavigation.view.frame = view.frame
        view.addSubview(childNavigation.view)
        childNavigation.didMove(toParent: self)
        
        childNavigation.navigationBar.isTranslucent = false
        
        // 3
        rootVC.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: nil, action: #selector(back))

    }
    
    @IBAction func back() {
        navigationController?.popViewController(animated: true)
    }
    
}
