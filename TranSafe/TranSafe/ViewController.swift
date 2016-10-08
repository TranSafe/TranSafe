//
//  ViewController.swift
//  TranSafe
//
//  Created by Kevin Asistores on 10/8/16.
//  Copyright © 2016 Kevin Asistores. All rights reserved.
//

import UIKit
import DTMHeatmap
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.mapView.delegate = self
//        // Create DTMHeatmap
//        self.heatmap = DTMHeatmap()
//        self.heatmap.data = myData
//        self.mapView.addOverlay(self.heatmap)
//        // or...
//        // Create DTMDiffHeatmap
//        self.diffHeatmap = DTMDiffHeatmap()
//        self.diffHeatmap.setBeforeData(beforeData, afterData: afterData)
//        self.mapView.addOverlay(self.diffHeatmap)
//    }
//    
//    func mapView(mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        return DTMHeatmapRenderer(overlay)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

