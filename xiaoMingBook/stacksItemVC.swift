//
//  stacksItemVC.swift
//  xiaoMingBook
//
//  Created by 任茗赫 on 2017/7/12.
//  Copyright © 2017年 任茗赫. All rights reserved.
//

import UIKit
import SVProgressHUD


class stacksItemVC: UITableViewController {
    
    var booItemTitle = 0;
    var dataSet : NSMutableArray = [] as NSMutableArray;
    var index = 0;
       
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show();
        getStacksItemInfo(type: booItemTitle, index: index);
        // 加载xib
        let cellNib = UINib(nibName: "stacksItemCell", bundle: nil);
        self.tableView.register(cellNib, forCellReuseIdentifier: "itemCell");
        
        let loadMoreView = UIView();
        loadMoreView.frame.size.height = 30;
        loadMoreView.backgroundColor = UIColor.black;
        
        self.tableView.tableFooterView = loadMoreView;
        
        // 取消分割线
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
        return self.dataSet.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! stacksItemCell;
        cell.title.text = (self.dataSet[indexPath.row] as AnyObject)["title"] as? String;
        cell.auther.text = (self.dataSet[indexPath.row] as AnyObject)["author"] as? String;
        cell.textCount.text = (self.dataSet[indexPath.row] as AnyObject)["introduce"] as? String;
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
    // 获取分类数据
    func getStacksItemInfo(type: Int, index: Int) {
        
        shareNetwork.request(requestType: HTTPRequestMethod.GET, urlString: Domain.appending("stacks/all/").appending(String(type)).appending("/").appending(String(index)).appending("/"), parameters: nil) { (res) in
            SVProgressHUD.dismiss();
            
            let resObj = res as AnyObject;
            let status = resObj["status"] as! Int;
            let count = resObj["count"] as! Int;
            if (status == 200) {
                if (count > 0) {
                    let dataArr = resObj["dataSet"] as AnyObject;
                    for i in 0..<dataArr.count {
                        self.dataSet.add(dataArr[i]);
                    }
                    // 刷新界面
                    self.tableView.reloadData();
                }
                
            }
            
            
        }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // 监听屏幕滚动
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height - 49 - 64;    // 当前页面总高度
        let contentYoffset = scrollView.contentOffset.y + 64;    // 滚动距离
        print(contentYoffset);
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset;
        print(distanceFromBottom);
        if (distanceFromBottom < height) {
            
            print("到底了~");
            
        }
        
    }

    
}
