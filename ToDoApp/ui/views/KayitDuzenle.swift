//
//  KayitDuzenle.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 1.08.2023.
//

import UIKit

class KayitDuzenle: UIViewController {

    @IBOutlet weak var tfKayit: UITextField!
    
    var kayit: Kayitlar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let orn = kayit {
            tfKayit.text = orn.kayit_icerik
        }
        
    }
    
    @IBAction func buttonUpdate(_ sender: Any) {
        if let ornIcerik = tfKayit.text , let orn = kayit{
            guncelle(kayit_id: orn.kayit_id!, kayit_icerik: ornIcerik)
        }
        
    }
    func guncelle(kayit_id:Int,kayit_icerik:String) {
        print("Güncellendi : \(kayit_id)-\(kayit_icerik)")
    }
}
