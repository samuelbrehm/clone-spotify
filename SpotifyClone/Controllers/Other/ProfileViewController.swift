//
//  ProfileViewController.swift
//  SpotifyClone
//
//  Created by Samuel Brehm on 19/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var models: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.addSubview(tableView)
        self.fetchProfile()
        view.backgroundColor = .systemBackground
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func fetchProfile() {
        APICaller.shared.getCurrentUserProfile { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.updateUI(with: model)
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.failedGetProfile()
                }
            }
        }
    }
    
    private func updateUI(with model: UserProfilie) {
        tableView.isHidden = false
        // Configure models
        self.models.append("Full Name: \(model.display_name)")
        self.models.append("Email Address: \(model.email)")
        self.models.append("User ID: \(model.id)")
        self.models.append("Plan: \(model.product)")
        
        tableView.reloadData()
    }
    
    private func failedGetProfile() {
        let label = UILabel(frame: .zero)
        label.text = "Failed to load profile."
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
    }
    
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.models[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    
}
