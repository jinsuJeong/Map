//
//  DetailViewController.swift
//  Custom TableView Cell
//
//  Created by D7703_18 on 2018. 5. 28..
//  Copyright © 2018년 정준수. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var cellImageView: UIImageView!
    var cellImage: String = ""
    @IBOutlet weak var loca: UILabel!
    var loc: String = ""
    @IBOutlet weak var tel: UILabel!
    var te: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellImageView.image = UIImage(named: cellImage)
        loca.text = loc
        tel.text = te
        
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
