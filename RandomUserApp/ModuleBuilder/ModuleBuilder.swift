//
//  ModuleBuilder.swift
//  RandomUserApp
//
//  Created by macbook on 27.11.2023.
//

import UIKit

protocol Builder {
    static func createModule() -> UIViewController
}

final class ModuleBuilder: Builder {
    static func createModule() -> UIViewController {
        let view = UserController()
        let presenter = MainPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    
}
