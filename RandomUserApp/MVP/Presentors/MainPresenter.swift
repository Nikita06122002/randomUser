//
//  MainPresenter.swift
//  RandomUserApp
//
//  Created by macbook on 27.11.2023.
//

import Foundation
//View
protocol UserViewProtocol: AnyObject {
    func updateUser(_ user : UserModel)
    func showError(_ with: Error)
}

protocol UserProtocol: AnyObject {
    
    init(view: UserViewProtocol)
}

final class MainPresenter: UserProtocol {
    let view: UserViewProtocol!
    
    var userManager = RandomUserManager()
    
    func fetch() {
        userManager.fetchUser()
    }
    
    required init(view: UserViewProtocol) {
        self.view = view
        userManager.delegate = self
    }
    
    
}

extension MainPresenter: RandomUserDelegate {
    func didUpdateUser(_ manager: RandomUserManager, user: UserModel) {
        view?.updateUser(user)
    }
    
    func didFailWithError(error: Error) {
        view?.showError(error)
    }
    
    
}
