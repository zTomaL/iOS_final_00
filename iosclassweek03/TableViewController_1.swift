//
//  TableViewController_1.swift
//  iosclassweek03
//
//  Created by YEN JUILEE on 2017/6/13.
//  Copyright © 2017年 YEN JUILEE. All rights reserved.
//

import UIKit

class TableViewController_1: UITableViewController {
    var piclist = [[String:String]]()
    let picTitle = "picTitle", picName = "picName"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        piclist = [[picTitle:"伊布王",picName:"伊布王"],[picTitle:"牽牽",picName:"牽牽"],[picTitle:"萬聖節塗鴉",picName:"萬聖節塗鴉"],[picTitle:"隨筆",picName:"隨筆"],[picTitle:"食物女神",picName:"食物女神"],[picTitle:"黑白童子",picName:"黑白童子"]]
        checkListFile()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return piclist.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        let dic = piclist[indexPath.row]
        
        cell.textLabel?.text = dic[picTitle]
        
        // Configure the cell...

        return cell
    }
 

    func checkListFile(){
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("quickPicList.txt")
        
        do{
            _ = try String(contentsOf: url!, encoding: String.Encoding.utf8)
        }
        catch{
            let s = ""
            do{
                try s.write(to: url!, atomically: false, encoding: String.Encoding.utf8)
            }catch{
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let next = segue.destination as! TabBarController
        let indexPath = tableView.indexPathForSelectedRow
        let dic = piclist[(indexPath?.row)!]
        
        next.picName = dic[picTitle]!
    }
    

}
