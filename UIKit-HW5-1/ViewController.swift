//
//  ViewController.swift
//  UIKit-HW5-1
//
//  Created by Дима on 11/27/24.
//

import UIKit

class ViewController: UIViewController {
    lazy var users : [Object] = {
        return Object.mockData().filter({$0.type == .user})
    }()
    lazy var groups : [Object] = {
        return Object.mockData().filter({$0.type == .group})
    }()
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // bad
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return users.count
        case 1: return groups.count
        default : return 0
        }
    }

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content : [Object]
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        
        switch indexPath.section {
        case 0: content = users
        case 1: content = groups
        default : content = []
        }
        
        config.text = content[indexPath.row].name
        let size: CGFloat = 24
        if let image = UIImage(named: content[indexPath.row].image) {
            config.image = resizeImage(image, width: size, height: size)
        }
        config.secondaryText = content[indexPath.row].description
        cell.contentConfiguration = config
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Users"
        case 1: return "Groups"
        default : return ""
        }
    }
}

func resizeImage(_ image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
    let size = CGSize(width: width, height: height)
    let renderer = UIGraphicsImageRenderer(size: size)

    return renderer.image { _ in
        let rect = CGRect(origin: .zero, size: size)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 6)
        path.addClip()
        image.draw(in: rect)
    }
}
