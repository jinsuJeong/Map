//
//  DetailViewController.swift
//  Custom TableView Cell
//
//  Created by D7703_18 on 2018. 5. 28..
//  Copyright © 2018년 정준수. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
//        if indexPath.row == 0 {
//            cell.textLabel?.text = "주소:"+loc
//            return cell
//        }else if indexPath.row == 1{
//            cell.textLabel?.text = "전화번호:"+te
//            return cell
//        }else {
//            cell.textLabel?.text = "메뉴:"+menu
//            return cell
//        }
        
        switch (indexPath.row) {
        case 0:
            cell.textLabel?.text = "주소:"+loc
            return cell
        case 1:
            cell.textLabel?.text = "전화번호:"+te
            return cell
        default:
            cell.textLabel?.text = "메뉴:"+menu
            return cell
        }
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    @IBOutlet weak var cellImageView: UIImageView!
    var cellImage: String = ""

    var loc: String = ""

    var te: String = ""
    @IBOutlet weak var detailTableView: UITableView!
    var menu: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.delegate=self
        detailTableView.dataSource=self
        
        cellImageView.image = UIImage(named: cellImage)
        
        
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
