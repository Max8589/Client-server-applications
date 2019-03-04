//
//  MyGroupsTableViewController.swift
//  VKApp
//
//  Created by admin on 10/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

    var groups: [VKApplicationViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsTableViewCell", for: indexPath) as! MyGroupsTableViewCell
        // Получаем группу для конкретной строки
        let group = self.groups[indexPath.row]
        
        // Устанавливаем группу в надпись ячейки
        cell.setViewModel(viewModel: group)

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем группу из массива
            groups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //      Проверка перехода (на экран добавления группы)
        if segue.identifier == "addGroup", let dest = segue.destination as? GroupsVKViewController {
            //          Оповещаем экран добавления города что мы умеем добавлять группы (устанавливаем себя делегатом)
            dest.delegate = self
        }
    }
}

extension MyGroupsTableViewController: AddGroupDelegate {
    //  Добавление города в таблицу
    func addGroup(group: VKApplicationViewModel) {
        print("addGroup \(String(describing: group.group))")
        //      Если группы нет - добавляем в массив и перезагружаем таблицу
    }
}
