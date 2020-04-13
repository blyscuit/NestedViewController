//
//  ViewController.swift
//  NestedNav
//
//  Created by Pisit W on 18/3/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func new_nav(_ sender: Any) {
        let cvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        
        let nestedVC = NestedViewController(rootNavigation: UINavigationController(rootViewController: cvc))
        var nav = navigationController
        while ((nav?.navigationController) != nil) {
            nav = nav?.navigationController
        }
        DispatchQueue.main.async {
            nestedVC.rootVC.navigationController?.navigationBar.barTintColor = UIColor.random()
        }
        nav?.pushViewController(nestedVC, animated: true)
    }
    
    @IBAction func same_nav(_ sender: Any) {
            
        let cvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        navigationController?.pushViewController(cvc, animated: true)
    }
    
}
