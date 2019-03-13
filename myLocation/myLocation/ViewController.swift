//
//  ViewController.swift
//  myLocation
//
//  Created by Vilmar Ferreira Gomes on 12/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {
    @IBOutlet weak var mapa: MKMapView!
    
    @IBOutlet weak var labelVelocidade: UILabel!
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    @IBOutlet weak var labelEndereco: UILabel!
    
    var gerenciadorLocal = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse{
            let alertaController = UIAlertController(title: "Permissão de localização", message: "Necessário permissão!!", preferredStyle: .alert)
            let acaoConfigurar = UIAlertAction(title: "Abrir configuração", style: .default, handler: {(alertaConfiguracoes) in
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            let acaoCancelar = UIAlertAction(title: "Cancelar", style:.cancel, handler: nil)
            alertaController.addAction(acaoConfigurar)
            alertaController.addAction(acaoCancelar)
            
            present(alertaController, animated: true, completion: nil)
        }
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
        //atualizar labels
        labelLatitude.text = String( latitude)
        labelLongitude.text = String(longitude)
        labelVelocidade.text = String(localizacaoUsuario.speed)
//        labelEndereco.text = String( localizacaoUsuario.course)
        
        
        CLGeocoder().reverseGeocodeLocation( localizacaoUsuario, completionHandler: {(detalhesLocal, erro) in
            if erro == nil {
                if let dadosLocal = detalhesLocal?.first {
                    var thoroughfare = ""
                    if dadosLocal.thoroughfare != nil{
                        thoroughfare = dadosLocal.thoroughfare!
                        
                    }
                    var subThoroughfare = ""
                    if dadosLocal.subThoroughfare != nil {
                        subThoroughfare = dadosLocal.subThoroughfare!
                    }
                    var locality = ""
                    if dadosLocal.locality != nil{
                        locality = dadosLocal.locality!
                    }
                    var subLocality = ""
                    if dadosLocal.subLocality != nil {
                        subLocality = dadosLocal.subLocality!
                    }
                    var country = ""
                    if dadosLocal.country != nil{
                        country = dadosLocal.country!
                    }
                    var endereco:String = thoroughfare + " " + subThoroughfare + " Cidade: " + locality + " Bairro:" + subLocality + " País:" + country
                    self.labelEndereco.text = endereco
                }
                
                
            }
            else{
                
            }
        })
    }


}

