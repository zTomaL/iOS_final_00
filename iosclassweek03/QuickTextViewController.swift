//
//  QuickTextViewController.swift
//  iosclassweek03
//
//  Created by YEN JUILEE on 2017/6/20.
//  Copyright © 2017年 YEN JUILEE. All rights reserved.
//

import UIKit

class QuickTextViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var textList = [String:String]()
    var picName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        textList = ["伊布王":"https://goo.gl/Zwxzzc","牽牽":"https://goo.gl/Q9ZixC","萬聖節塗鴉":"https://goo.gl/P9ltZu","隨筆":"https://goo.gl/33FvJP","食物女神":"https://goo.gl/lr3zrH","黑白童子":"https://goo.gl/qdCEUR"]
        let parent = self.tabBarController as! QuickTabController
        picName = parent.picName
        
        textField.text = textList[picName]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
