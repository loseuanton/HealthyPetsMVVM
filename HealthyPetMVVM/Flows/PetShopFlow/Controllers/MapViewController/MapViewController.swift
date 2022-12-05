//
//  MapViewController.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 24.11.22.
//

import Foundation
import UIKit
import GoogleMaps
import GoogleMapsUtils


class MapViewController: UIViewController, GMSMapViewDelegate {
    
    // MARK: - Views
    var rootView = MapView()
    let viewModel = MapViewModel()
    let locationManager = CLLocationManager()
    private var clusterManager: GMUClusterManager!
    var types: [AllTypes]?
    var double = 0.0
    var double2 = 0.0
    
    
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        rootView.mapView.isMyLocationEnabled = true
        rootView.mapView.settings.myLocationButton = true
        configureView()
        myLocation()
        addMarker()
        addAllMarker()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    func configureView() {
        rootView.addSubviews()
        rootView.configureLayout()
        rootView.decorate()
        
    }
    func addAllMarker() {
        var markerArray: [GMSMarker] = []
        for type in viewModel.allTypesServices {
           
            let iconGenerator = GMUDefaultClusterIconGenerator()
                let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
            let renderer = GMUDefaultClusterRenderer(mapView: rootView.mapView,
                                            clusterIconGenerator: iconGenerator)
            clusterManager = GMUClusterManager(map: rootView.mapView, algorithm: algorithm,
                                                                  renderer: renderer)

                // Register self to listen to GMSMapViewDelegate events.
                clusterManager.setMapDelegate(self)
            let position = CLLocationCoordinate2D(latitude: type.latitude, longitude: type.longitude)
            let marker = GMSMarker(position: position)
            marker.title = type.name
            marker.snippet = type.adress
            marker.icon = UIImage(named: "markerIcon")
            markerArray.append(marker)
        }
        clusterManager.add(markerArray)
        clusterManager.cluster()
    }
    func myLocation() {
        rootView.mapView.camera = GMSCameraPosition(
            target: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0),
            zoom: 9,
            bearing: 0,
            viewingAngle: 0)
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)
//        marker.title = "Hey Hi"
//        marker.snippet = "Im here"
//        marker.icon = UIImage(systemName: "plus")

      //  marker.map = rootView.mapView
    }
    func addMarker() {
        var markerArray: [GMSMarker] = []
        for type in viewModel.typeServices {
           
            let iconGenerator = GMUDefaultClusterIconGenerator()
                let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
            let renderer = GMUDefaultClusterRenderer(mapView: rootView.mapView,
                                            clusterIconGenerator: iconGenerator)
            clusterManager = GMUClusterManager(map: rootView.mapView, algorithm: algorithm,
                                                                  renderer: renderer)

                // Register self to listen to GMSMapViewDelegate events.
                clusterManager.setMapDelegate(self)
            let position = CLLocationCoordinate2D(latitude: type.latitude, longitude: type.longitude)
            let marker = GMSMarker(position: position)
            marker.title = type.name
            marker.snippet = type.adress
            marker.icon = UIImage(named: "markerIcon")
            markerArray.append(marker)
        }
        clusterManager.add(markerArray)
        clusterManager.cluster()
    }
    

}


