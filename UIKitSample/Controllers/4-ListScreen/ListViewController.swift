//
//  ListViewController.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import UIKit
import SwiftUI
import SwiftData

class ListViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private let container = try! ModelContainer(for: User.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    private var users: [User] = []
    
    deinit {
        print(#function)
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
                
        title = "Users"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            primaryAction: UIAction(
                title: "Add User",
                image: .init(systemName: "plus")
            ) { _ in
//                let sheet = UIHostingController(
//                    rootView: AddUserView(onAdd: self.loadUsers)
//                        .modelContainer(self.container)
//                )
                let sheet = UINavigationController(
                    rootViewController: AddUserViewController(
                        modelContext: self.container.mainContext,
                        onAdd: self.loadUsers
                    )
                )
                self.present(sheet, animated: true)
            }
        )

        addSampleUsers()
        loadUsers()
    }
    
    func addSampleUsers() {
        let taylor = User(name: "Taylor Swift", birthYear: 1989)
        let beyonce = User(name: "Beyoncé", birthYear: 1981)
        let ed = User(name: "Ed Sheeran", birthYear: 1991)

        container.mainContext.insert(taylor)
        container.mainContext.insert(beyonce)
        container.mainContext.insert(ed)
    }
    
    func loadUsers() {
        let descriptor = FetchDescriptor<User>(sortBy: [SortDescriptor(\.name)])
        users = (try? container.mainContext.fetch(descriptor)) ?? []
        tableView.reloadData()
    }
    
    func deleteUser(at indexPath: IndexPath) {
        let user = users[indexPath.row]
        container.mainContext.delete(user)
        users.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration {
            LabeledContent(user.name, value: "\(user.birthYear)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        print(user.name)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete", handler: { (_, _, completion) in
            self.deleteUser(at: indexPath)
            completion(true)
        })
        action.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}

#Preview {
    UINavigationController(rootViewController: ListViewController())
}
