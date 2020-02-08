//
//  secondVCViewController.swift
//  mysirstAPP
//
//  Created by Wei on 2020/1/24.
//  Copyright © 2020 Wei. All rights reserved.
//

import UIKit

class secondVCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTask.count
    }
    
    
    var myTask:[String] = []

    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var taskTextField: UITextField!
    
    @IBAction func addTask(_ sender: Any) {
          // 檢查 textField 是否沒有輸入值，若為空就執行 showAlert 並 return
        // 這邊我們 showAlert 會跳出一個警告視窗
        if taskTextField.text == "" {
//          showAlert()
            print("111")
          return
        }
        // 將任務加到 Array 中

        myTask.append(taskTextField.text!)
        // 將 textField 清空

        taskTextField.text = ""
        // 重新載入我們的 TableView

        listTableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myTask[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        // Do any additional setup after loading the view.
        listTableView.dataSource = self
        listTableView.delegate = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
           super.setEditing(editing, animated: animated)
           listTableView.setEditing(editing, animated: true)
       }
    
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    switch editingStyle {
    case UITableViewCellEditingStyle.delete:
        myTask.remove(at: indexPath.row)
        listTableView.reloadData()
    default:
        break
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
