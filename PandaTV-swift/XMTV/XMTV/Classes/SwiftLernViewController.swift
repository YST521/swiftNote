//
//  SwiftLernViewController.swift
//  XMTV
//
//  Created by youxin on 2017/7/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class SwiftLernViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    var tabview:UITableView? = nil;
    var datasour:NSArray?  = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "swift学习笔记"
        self.view.backgroundColor = UIColor.white
        
        self.creatData()
        self.creatUI()
        
    }
    func creatData(){

        self.datasour = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    }
    
    func creatUI(){
        
       tabview = UITableView.init()
       tabview?.frame = CGRect(x:0,y:0,width:kScreenW,height:kScreenH);
        self.view.addSubview(tabview!)
        
        tabview?.dataSource = self
        tabview?.delegate = self
//        tabview?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        
           tabview?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    
    }
    
  //******************tabviewdeleagte****************
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasour!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell : UITableViewCell = (tabview?.dequeueReusableCell(withIdentifier:"cell"))!
        cell.backgroundColor = UIColor.green
        cell.textLabel?.text  = self.datasour?[indexPath.row] as? String
        
        return cell
    }
  
    func deselectRow(at indexPath: IndexPath, animated: Bool){
    
        let pointVC : PointKnowledgeVC = PointKnowledgeVC()
        
        self.navigationController?.pushViewController(pointVC, animated:true)
    
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
