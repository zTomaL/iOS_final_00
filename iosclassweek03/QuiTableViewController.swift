//
//  QuiTableViewController.swift
//  iosclassweek03
//
//  Created by YEN JUILEE on 2017/6/20.
//  Copyright © 2017年 YEN JUILEE. All rights reserved.
//

import UIKit

class QuiTableViewController: UITableViewController {
    
    var quickList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        quickList = ["伊布王","萬聖節塗鴉"]
        loadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quickList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quickListCell", for: indexPath)

        cell.textLabel?.text = quickList[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            quickList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            addToList()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    func loadData(){
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("quickPicList.txt")
        
        let temp = quickList
        do{
            let content = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            quickList.removeAll()
            for line in content.components(separatedBy: "\n"){
                quickList.append(line)
            }
        }catch{
            quickList = temp
        }
    }
    
    func addToList(){
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("quickPicList.txt")
        var s = ""
        
        for name in quickList{
            s += name + "\n"
        }
        
        do{
            try s.write(to: url!, atomically: false, encoding: String.Encoding.utf8)
        }catch{}
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let next = segue.destination as! QuickTabController
        let indexPath = tableView.indexPathForSelectedRow
        next.picName = quickList[(indexPath?.row)!]
        
    }
 

}
