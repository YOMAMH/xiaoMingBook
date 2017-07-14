//
//  stacksTableVC.swift
//  xiaoMingBook
//
//  Created by 任茗赫 on 2017/7/3.
//  Copyright © 2017年 任茗赫. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD
let shareNetwork = NetworkManager.shared;
let Domain = "http://127.0.0.1:8000/";
var dataSet : AnyObject = [] as AnyObject;


class stacksTableVC: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "书库";
        
        SVProgressHUD.show();
        // 请求分类数据
        shareNetwork.request(requestType: HTTPRequestMethod.GET, urlString: Domain.appending("stacks/category/"), parameters: nil) { (res) in
            SVProgressHUD.dismiss();
            let resObj = res as AnyObject;
            let status = resObj["status"] as! Int;
            if (status == 200) {
               dataSet = resObj["dataSet"] as AnyObject;
                self.tableView.reloadData();

            }
        }
        
        // 加载xib
        let cellNib = UINib(nibName: "stacksCell", bundle: nil);
        self.tableView.register(cellNib, forCellReuseIdentifier: "cell");
        // 取消cell分割线
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none;


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
        return dataSet.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! stacksCell
    
        cell.typeTitle.text = (dataSet[indexPath.row] as AnyObject)["category_title"] as? String;
        let str = (dataSet[indexPath.row] as AnyObject)["icon"] as? String;
        cell.typeIcon.sd_setImage(with: NSURL(string: str!)! as URL);
        
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookItem = stacksItemVC();
        bookItem.booItemTitle = indexPath.row + 1;
        self.navigationController?.pushViewController(bookItem, animated: true);
    
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       
//    }
    
    

}
