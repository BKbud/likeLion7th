//
//  DetailViewController.swift
//  myTodoList
//
//  Created by 정보경 on 3/21/25.
//

import UIKit

protocol DetailTodoControllerDelegate: AnyObject {
    func didUpdateTodoItem(item: TodoItem)
}

class DetailViewController: UIViewController, DetailTodoControllerDelegate {
    
    var item: TodoItem?
    var delegate: TodoTableViewControllerDelegate?
    
    private let titleLabel = UILabel()
    private let contentLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.largeTitleDisplayMode = .never
        
        setupEditButton()
        setupUI() // UI 설정
        updateUI() // 데이터 설정
    }
    
    private func setupEditButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(didTabEdit))
    }
    
    private func setupUI() {
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont.systemFont(ofSize: 16)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func updateUI() {
        titleLabel.text = item?.title
        contentLabel.text = item?.content
    }
    
    @objc private func didTabEdit() {
        
        let vc = EditTodoController()
        vc.delegate = self
        vc.item = item
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didUpdateTodoItem(item: TodoItem) {
        self.item = item
        updateUI()
        
        delegate?.editTodoItem(item: item)
    }
}
