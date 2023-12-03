//
//  RandomUserDelegate.swift
//  RandomUserApp
//
//  Created by macbook on 27.11.2023.
//

import Foundation

protocol RandomUserDelegate: AnyObject {
    func didUpdateUser(_ manager: RandomUserManager, user: UserModel)
    func didFailWithError(error: Error)
}
