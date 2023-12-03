//
//  ViewController.swift
//  RandomUserApp
//
//  Created by macbook on 27.11.2023.
//

import UIKit
import SDWebImage

class UserController: UIViewController {
    
    
    private let name = UILabel()
    private let gender = UILabel()
    private let email = UILabel()
    private let picture = UIImageView()
    private let button = UIButton()
    
    var presenter: MainPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    private func setupView() {
        view.addSubviews(name, gender, email, picture, button)
        view.enableTamic()
        
        name.font = .systemFont(ofSize: 30)
        gender.font = .systemFont(ofSize: 20)
        email.font = .systemFont(ofSize: 20)
        
        name.text = "Name"
        gender.text = "Gender"
        email.text = "Email"
        picture.clipsToBounds = true
        picture.layer.cornerRadius = 20
        
        button.setTitle("Сгенерировать пользователя", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            picture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            picture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picture.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            picture.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            picture.heightAnchor.constraint(equalToConstant: 250),
            picture.widthAnchor.constraint(equalToConstant: 250),
            
            
            name.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 100),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            name.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            gender.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 40),
            gender.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gender.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            gender.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            email.topAnchor.constraint(equalTo: gender.bottomAnchor, constant: 40),
            email.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            email.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            email.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            button.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
            
        ])
    }
    
    @objc private func buttonTapped() {
        presenter.fetch()
    }


}

extension UserController: UserViewProtocol {
    func updateUser(_ user: UserModel) {
        let name = user.title + " " + user.first + " " + user.last
        DispatchQueue.main.async {
            self.name.text = name
            self.gender.text = user.gender
            self.email.text = user.email
            //Добавить SDWebImage
            if let imageURL = URL(string: user.picture) {
                self.picture.sd_setImage(with: imageURL)
            }
            
            
        }
    }
    
    func showError(_ with: Error) {
        print(with)
    }
    
    
}



//MARK: - SwiftUI
import SwiftUI
struct Provider_UserController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return UserController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = UserController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_UserController.ContainterView>) -> UserController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_UserController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_UserController.ContainterView>) {
            
        }
    }
    
}
