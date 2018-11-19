//
//  ItemsTableView.swift
//  Liken
//
//  Created by Qahtan on 11/17/18.
//  Copyright © 2018 DiverApp. All rights reserved.
//

import UIKit
class ItemsTableView: UITableView {
    
    let cellId = "cellId"
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.register(ItemsTableViewCell.self, forCellReuseIdentifier:cellId)
        self.delegate = self
        self.dataSource = self
        self.allowsSelection = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func incressTheCount(sender:UIButton) {
        let indexPath = IndexPath(item: sender.tag, section: 0)
        guard let cell = self.cellForRow(at: indexPath) as? ItemsTableViewCell else { return }
        cell.counter += 1
        cell.counterLabel.text = "\(cell.counter)"
    }
    @objc func decressTheCount(sender:UIButton) {
        let indexPath = IndexPath(item: sender.tag, section: 0)
        guard let cell = self.cellForRow(at: indexPath) as? ItemsTableViewCell else { return }
        cell.counter -= 1
        cell.counterLabel.text = "\(cell.counter)"
    }
}
extension ItemsTableView: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemsTableViewCell
            cell.pluseButton.tag = indexPath.row
            cell.pluseButton.addTarget(self, action: #selector(incressTheCount), for: .touchUpInside)
            cell.minuesButton.tag = indexPath.row
            cell.minuesButton.addTarget(self, action: #selector(decressTheCount), for: .touchUpInside)
        print(cell.counter)
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    
}
