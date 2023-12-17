//
//  ViewController.swift
//  SwiftDepInj
//
//  Created by Айбек on 17.12.2023.
//

import UIKit
import Swinject

class ViewController: UIViewController {
    
    //Swinject
    let container : Container = {
        let container = Container()
        
        container.register(backgroundProvidingClass.self) { resolver in
            return backgroundProvidingClass()
        }
        
        container.register(AnotherViewController.self) { resolver in
            let vc = AnotherViewController(providerProtocol: resolver.resolve(backgroundProvidingClass.self)!)
            return vc
        }
        
        return container
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        button.setTitle("Update", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(butClicked), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func butClicked() {
        if let viewCont = container.resolve(AnotherViewController.self) {
            present(viewCont, animated: true)
        }
    }

}

