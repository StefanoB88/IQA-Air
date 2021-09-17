//
//  ViewIQA.swift
//  IQA Air
//
//  Created by Stefano Brandi on 20/07/21.
//

import UIKit
import AVKit

class ViewIQA: UIViewController {
    
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblAqi: UILabel!
    @IBOutlet weak var lblPm10: UILabel!
    @IBOutlet weak var lblCo: UILabel!
    @IBOutlet weak var lblO3: UILabel!
    @IBOutlet weak var lblNo2: UILabel!
    @IBOutlet weak var lblPm25: UILabel!
    @IBOutlet weak var lblSo2: UILabel!
    
    @IBOutlet weak var imgAqi: UIImageView!
    
    @IBOutlet weak var btnPm10: UIButton!
    @IBOutlet weak var btnCo: UIButton!
    @IBOutlet weak var btnO3: UIButton!
    @IBOutlet weak var btnNo2: UIButton!
    @IBOutlet weak var btnPm25: UIButton!
    @IBOutlet weak var btnSo2: UIButton!
    
    var polveri = Datamanager.shared.getData
    
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "Informazioni", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            AudioServicesPlaySystemSound(1520)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func btnPm10(_ sender: Any) {
        displayAlert(message: "Il termine PM10 identifica le particelle di diametro aerodinamico inferiore o uguale ai 10 μm. Queste sono caratterizzate da lunghi tempi di permanenza in atmosfera e possono, quindi, essere trasportate anche a grande distanza dal punto di emissione.")
    }
    
    @IBAction func btnCo(_ sender: Any) {
        displayAlert(message: "Il monossido di carbonio si miscela bene con l’aria, formando miscele esplosive, e riesce a penetrare attraverso le pareti. Può reagire vigorosamente con ossigeno, acetilene, cloro, fluoro, ossidi di azoto. È un inquinante prevalentemente primario, emesso direttamente da tutti i processi di combustione incompleta dei composti carboniosi. Le sorgenti possono essere di tipo naturale (incendi, vulcani, emissioni da oceani, etc.)")
    }
    
    @IBAction func btnO3(_ sender: Any) {
        displayAlert(message: "L’ozono troposferico (O3) è un tipico inquinante secondario che si forma nella bassa atmosfera a seguito di reazioni fotochimiche che interessano inquinanti precursori prodotti per lo più dai processi antropici. A causa della sua natura, l’ozono raggiunge i livelli più elevati durante il periodo estivo, quando l’irraggiamento è più intenso e tali reazioni sono favorite.")
    }
    
    @IBAction func btnNo2(_ sender: Any) {
        displayAlert(message: "Il biossido di azoto (NO2) è un inquinante che viene normalmente generato a seguito di processi di combustione. In particolare, tra le sorgenti emissive, il traffico veicolare è stato individuato essere quello che contribuisce maggiormente all’aumento dei livelli di biossido d’azoto nell’aria ambiente. L’NO2 è un inquinante per lo più secondario, che svolge un ruolo fondamentale nella formazione dello smog fotochimico in quanto costituisce l’intermedio di base per la produzione di tutta una serie di inquinanti secondari pericolosi come l’ozono, l’acido nitrico e l’acido nitroso.")
    }
    
    
    
    @IBAction func btnPm25(_ sender: Any) {
        displayAlert(message: "Il termine PM2,5 identifica le particelle di diametro aerodinamico inferiore o uguale ai 2,5 μm, una frazione di dimensioni aerodinamiche minori del PM10 e in esso contenuta. Il particolato PM2,5 è detto anche ‘particolato fine’, denominazione contrapposta a ‘particolato grossolano’ che indica tutte quelle particelle sospese con d.a. maggiore di 2,5 μm o, all’interno della frazione PM10, quelle con d.a. compreso tra 2,5 e 10 μm.")
    }
    
    
    
    @IBAction func btnSo2(_ sender: Any) {
        displayAlert(message: "Il biossido di zolfo reagisce violentemente con l'ammoniaca e le ammine, l'acetilene, i metalli alcalini, il cloro, l'ossido di etilene e in presenza di acqua o vapore acqueo può attaccare molti metalli, tra cui l'alluminio, il ferro, l'acciaio, l'ottone, il rame e il nichel. Liquefatto, può corrodere le materie plastiche e la gomma. La presenza in atmosfera è dovuta soprattutto alla combustione di combustibili fossili (carbone e derivati del petrolio)")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch polveri.data![0].aqi! {
        
        case 0...50:
            lblAqi.textColor = .systemGreen
            imgAqi.image = #imageLiteral(resourceName: "good")
            
        case 50...100:
            lblAqi.textColor = .systemOrange
            imgAqi.image = #imageLiteral(resourceName: "so")
            
        case 100...150:
            lblAqi.textColor = .systemRed
            imgAqi.image = #imageLiteral(resourceName: "so")
            
        case 150...999:
            lblAqi.textColor = .systemPurple
            imgAqi.image = #imageLiteral(resourceName: "bad")
            
        default:
            break
        }
        
        if polveri.city_name == "" {
            lblCity.text = "N/A"
        } else {
            lblCity.text = polveri.city_name
        }
        
        lblAqi.text = "Indice qualità dell'aria: " + "\(polveri.data![0].aqi ?? 0)"
        lblPm10.text = "Polvere PM10: " + "\(polveri.data![0].pm10 ?? 0)"
        lblCo.text = "Monossido di carbonio: " + "\(polveri.data![0].co ?? 0)"
        lblO3.text = "Ozono: " + "\(polveri.data![0].o3 ?? 0)"
        lblNo2.text = "Biossido di azoto: " + "\(polveri.data![0].no2 ?? 0)"
        lblPm25.text = "Polvere PM25: " + "\(polveri.data![0].pm25 ?? 0)"
        lblSo2.text = "Anidride solforosa: " + "\(polveri.data![0].so2 ?? 0)"
        
    }
    
}
