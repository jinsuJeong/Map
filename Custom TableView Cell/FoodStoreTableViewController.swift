//
//  FoodStoreTableViewController.swift
//  Custom TableView Cell
//
//  Created by 정준수 on 2018. 5. 21..
//  Copyright © 2018년 201550057. All rights reserved.
//

import UIKit

class FoodStoreTableViewController: UITableViewController {
    var foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락",  "홍콩반점"]
    var foodStoreImages = ["01", "02", "03", "04", "05",  "06"]
    var foodStoreLocation = ["부산광역시 부산진구 양정동 418-282","부산광역시 부산진구 양정동 393-18",
                             "부산광역시 부산진구 양정1동 356-22", "부산광역시 부산진구 양정동",
                            "부산광역시 부산진구 양정1동 350-1", "부산광역시 부산진구 양정1동 중앙대로 902"]
    var foodStoreTel = ["055-111-1111", "055-222-2222", "055-333-3333", "055-444-4444", "055-555-5555", "055-666-6666"]
    var foodMenus=["수육백반, 돼지국밥, 순대국밥, 내장국밥","자장면, 짬뽕, 짬짜면, 탕수육, 탕짜면, 군만두, 양장피","떡볶이, 오뎅, 떡강정, 핫도그, 튀김","자장면, 짬뽕, 짬짜면, 탕수육, 탕짜면, 군만두, 양장피","치킨마요, 참치마요, 돈불와퍼, 돈치와퍼, 돈까스카레","자장면, 짬뽕, 짬짜면, 탕수육, 탕짜면, 군만두, 양장피"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.title = " DIT 철가방"
    }
    @IBAction func editable(_ sender: Any) {
         tableView.isEditing = true
    }
    
    @IBAction func nonEditable(_ sender: Any) {
        tableView.isEditing = false
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodStoreNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath) as! FoodStoreTableViewCell

        // Configure the cell...
//        cell.textLabel?.text = foodStoreNames[indexPath.row]
//        cell.imageView?.image = UIImage(named: foodStoreImages[indexPath.row])
//        cell.imageView?.image = UIImage(named:"02")
        
        cell.nameLabel.text = foodStoreNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: foodStoreImages[indexPath.row])
        cell.locationLabel.text = foodStoreLocation[indexPath.row]
        cell.telLabel.text = foodStoreTel[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(foodStoreNames[indexPath.row])
        print(foodStoreTel[indexPath.row])
        
        //전화걸기
        /*let optionMenu = UIAlertController(title: "전화걸기" + foodStoreNames[indexPath.row], message: foodStoreTel[indexPath.row], preferredStyle: .actionSheet)
        let callAction = UIAlertAction(title: "전화를 거시겠습니까?", style: .default){
            (action:UIAlertAction) -> Void in
            let alert = UIAlertController(title: "전화 거는 중", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        present(optionMenu, animated: true, completion: nil)*/
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
           // tableView.deleteRows(at: [indexPath], with: .fade)
            
            foodStoreNames.remove(at: indexPath.row)
            foodStoreTel.remove(at: indexPath.row)
            foodStoreImages.remove(at: indexPath.row)
            foodStoreLocation.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.reloadData()
        }
        
//         else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let tmp1 = foodStoreNames[to.row]
        foodStoreNames[to.row] = foodStoreNames[fromIndexPath.row]
        foodStoreNames[fromIndexPath.row] = tmp1
        
        let tmp2 = foodStoreImages[to.row]
        foodStoreImages[to.row] = foodStoreImages[fromIndexPath.row]
        foodStoreImages[fromIndexPath.row] = tmp2
        
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! DetailViewController
                //이름
                destinationController.title = foodStoreNames[indexPath.row]
                //이미지
                destinationController.cellImage = foodStoreImages[indexPath.row]
                destinationController.loc = foodStoreLocation[indexPath.row]
                destinationController.te = foodStoreTel[indexPath.row]
                destinationController.menu = foodMenus[indexPath.row]
            }
        }else if segue.identifier=="totalMap"{
            let destinationController = segue.destination as! TotalMapViewController
            destinationController.locations=foodStoreLocation
            destinationController.names=foodStoreNames
        }
    }
    

}
