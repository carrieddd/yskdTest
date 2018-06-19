//
//  ViewController.swift
//  youshikoudaiTest
//
//  Created by iOS110 on 2018/6/19.
//  Copyright © 2018年 dongliang. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var dataSource:[HomeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func request() {
        Alamofire.request("http://static.youshikoudai.com/mockapi/data", method:.get, parameters:nil).responseJSON { [weak self](response) in
            switch response.result {
            case .success:
                let dict:[[String:Any]] = response.result.value as! [[String : Any]]
                self?.dataSource = dict.map{HomeModel.deserialize(from: $0)!}
                self?.table.reloadData()
                break
            case .failure(let error):
                print("\(String(describing: response.request?.url))\(error)")
                break
            }
        }
    }

}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "homecell") as! HomeTableViewCell
        cell.configure(model: dataSource[indexPath.row])
        return cell
    }
}
