//
//  ViewController.swift
//  Utilizando-mapas
//
//  Created by Vilmar Ferreira Gomes on 12/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
//importar
import MapKit

//herdar de MKMapView
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    //Criar uma referencia
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configurações iniciais
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
//        //latitude e longitude
//        let latitude: CLLocationDegrees = -10.313153
//        let longitude: CLLocationDegrees = -48.302609
//
//        //delta serve para definir o zoom
//        let deltaLatitude: CLLocationDegrees = 0.01
//        let deltaLongitude: CLLocationDegrees = 0.01
//
//        //criar localizacao
//        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
//
//        //coordinateSpan
//        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
//        //criando regiao do mapa
//        let regiao:MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacao)
//
//        //configurar o mapa
//        mapa.setRegion(regiao, animated: true)
//
//        //anotacoes
//        let anotacao = MKPointAnnotation()
//
//        // configurar
//        anotacao.coordinate = localizacao
//        anotacao.title = "Algum lugar"
//        anotacao.subtitle = "Localização de algum lugar"
//        mapa.addAnnotation(anotacao)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacaoUsuario: CLLocation = locations.last!
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude
        

        //delta serve para definir o zoom
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01

        //criar localizacao
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)

        //coordinateSpan
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        //criando regiao do mapa
        let regiao:MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacao)

        //configurar o mapa
        mapa.setRegion(regiao, animated: true)
        
    }


}

