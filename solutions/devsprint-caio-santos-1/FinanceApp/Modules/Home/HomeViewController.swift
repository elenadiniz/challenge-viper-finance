//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    
    lazy var homeView: HomeView = {
        let homeView: HomeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    override func viewDidLoad() {
        presenter?.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }

    override func loadView() {
        self.view = homeView
    }

    @objc
    func openProfile() {
        let navigationController = UserProfileRouter.createModule()
        self.present(navigationController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        guard let navigation = self.navigationController else { return }
        presenter?.pushToActivityDetails(navigation: navigation)
    }
}

extension HomeViewController: HomePresenterDelegate {
    func showData() {
        print("HomeViewController - HomePresenterDelegate - showData()")
    }
}
