//
//  kayitEkle.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 1.08.2023.
//

import UIKit

class KayitEkle: UIViewController {

    @IBOutlet weak var tfKayit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let icerik = tfKayit.text{
            kaydet(kayit_icerik: icerik)
            }
        
    }
    
    func kaydet(kayit_icerik : String){
        print("Kaydedilen:  \(kayit_icerik)")
        
    }

}
