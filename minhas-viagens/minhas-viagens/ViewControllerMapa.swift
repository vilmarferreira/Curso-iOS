//
//  ViewControllerMapa.swift
//  minhas-viagens
//
//  Created by Vilmar Ferreira Gomes on 25/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerMapa: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var viagem: Dictionary<String,String> = [:]
    var indiceSelecionado: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let indice = indiceSelecionado{
            if indice == -1{ // adicionando
                configuraGerenciadorLocalizacao()
                
            }else{ // listando
                exibirAnotacao(viagem: viagem)
            }
        }
        
        
        //reconhecedor de gestos
        let reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector(ViewControllerMapa.marcar(gesture:)))
        reconhecedorGesto.minimumPressDuration = 2
        mapa.addGestureRecognizer(reconhecedorGesto)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let local = locations.last!
        exibirLocal(latitude: local.coordinate.latitude, longitude: local.coordinate.longitude)
    }
    func exibirLocal (latitude: Double, longitude: Double){
        let localizacao = CLLocationCoordinate2DMake(latitude,longitude)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let regiao = MKCoordinateRegion(center: localizacao, span: span)
        self.mapa.setRegion(regiao, animated: true)
    }
    func exibirAnotacao(viagem:Dictionary<String,String>){
        
        if let localViagem = viagem["local"]{
            if let latitudeS = viagem["latitude"]{
                if let longitudeS = viagem["longitude"]{
                    if let latitude = Double(latitudeS){
                        if let longitude = Double(longitudeS)
                        {
                            //adicionando anotacao
                            let anotacao = MKPointAnnotation()
                            anotacao.coordinate.latitude = latitude
                            anotacao.coordinate.longitude = longitude
                            anotacao.title = localViagem
                            self.mapa.addAnnotation(anotacao)
                            
                            //exibindo local
                            exibirLocal(latitude: latitude, longitude: longitude)
                        }
                    }
                }
            }
        }
        
    }
    
    @objc func marcar(gesture: UIGestureRecognizer){
        if gesture.state == UIGestureRecognizer.State.began {
            //Recuperar coordenadas pressionada
            let ponto = gesture.location(in: self.mapa)
            let coordenadas = mapa.convert(ponto, toCoordinateFrom: mapa)
            let localizacao = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            //Recuparar endereço do ponto selecionado
            var localCompleto = "Endereço não encontrado"
            CLGeocoder().reverseGeocodeLocation(localizacao, completionHandler: {(local,erro) in
                if erro == nil {
                    if let dadosLocal = local?.first {
                        if let nome = dadosLocal.name{
                            localCompleto = nome
                        } else {
                            if let endereco = dadosLocal.thoroughfare{
                                localCompleto = endereco
                            }
                        }
                    }
                    //salvar dados no dispositivo
                    self.viagem = ["local":localCompleto,"latitude":String(coordenadas.latitude),"longitude":String(coordenadas.longitude)]
                    armazenamentoDados().salvarViagem(viagem: self.viagem)
                    
                    //exbindo informação com os dados de endereco
                    self.exibirAnotacao(viagem: self.viagem)
                }
            })
            
            
        }
        
    }
    
    func configuraGerenciadorLocalizacao()
    {
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
