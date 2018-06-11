//
//  TotalMapViewController.swift
//  Custom TableView Cell
//
//  Created by D7703_18 on 2018. 6. 11..
//  Copyright © 2018년 정준수. All rights reserved.
//

import UIKit
import MapKit

class TotalMapViewController: UIViewController {
    var count=0
    @IBOutlet weak var totalMapView: MKMapView!
    //주소 배열 받는 곳
    var locations = [String]()
    var names=[String]()
    
    //pin 저장 배열
    var annotations=[MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(locations)
        
        //geocoding
        viewMap(locations: locations, names: names)
        

        // Do any additional setup after loading the view.
    }
    
    func viewMap(locations: [String], names: [String]){
        for addr in locations {
            
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(addr) {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let myError = error {
                    print(myError)
                    return
                }
                
                if let myPlacemarks=placemarks{
                    let myPlacemark=myPlacemarks[0]
                    let loc=myPlacemark.location?.coordinate
                    
                    let anno=MKPointAnnotation()
                    anno.coordinate=loc!
                    anno.title = names[self.count]
                    self.count = self.count+1
                    anno.subtitle=addr
                    //self.myMapView.addAnnotation(anno)
                    self.annotations.append(anno)
                    self.totalMapView.addAnnotations(self.annotations)
                    
                    //여러개의 pin을 지도에 꽉채움
                    self.totalMapView.showAnnotations(self.annotations, animated: true)
                }else{
                    print("nil 발생")
                }
                
            }
        }
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
