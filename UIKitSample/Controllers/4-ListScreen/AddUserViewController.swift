//
//  AddUserViewController.swift
//  UIKitSample
//
//  Created by Mateus Rodrigues.
//

import UIKit
import SwiftData

class AddUserViewController: UIViewController {
    
    private let modelContext: ModelContext
    private let onAdd: () -> Void
    
    private let nameTextField = UITextField()
    private let birthYearTextField = UITextField()
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    init(modelContext: ModelContext, onAdd: @escaping () -> Void) {
        self.modelContext = modelContext
        self.onAdd = onAdd
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "New User"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addUser)
        )
        
        tableView.dataSource = self
        tableView.delegate = self
        
        nameTextField.text = "Bruno Mars"
        nameTextField.placeholder = "Name"
        nameTextField.autocapitalizationType = .words
        nameTextField.clearButtonMode = .whileEditing
        
        birthYearTextField.text = "1985"
        birthYearTextField.placeholder = "Birth Year"
        birthYearTextField.keyboardType = .numberPad
        birthYearTextField.clearButtonMode = .whileEditing
    }
    
    @objc private func addUser() {
        let name = nameTextField.text ?? ""
        let birthYear = Int(birthYearTextField.text ?? "") ?? 1985
        let user = User(name: name, birthYear: birthYear)
        modelContext.insert(user)
        onAdd()
        dismiss(animated: true)
    }
}

extension AddUserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        
        let textField: UITextField
        switch indexPath.row {
        case 0:
            textField = nameTextField
        case 1:
            textField = birthYearTextField
        default:
            textField = UITextField()
        }
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.trailingAnchor),
            textField.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 12),
            textField.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -12)
        ])
        
        return cell
    }
}
