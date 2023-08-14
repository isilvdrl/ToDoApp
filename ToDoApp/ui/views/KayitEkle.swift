//
//  kayitEkle.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 1.08.2023.
//

import UIKit

class KayitEkle: UIViewController {

    @IBOutlet weak var tfKayit: UITextField!
    
    var viewModel = KayitEkleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let icerik = tfKayit.text{
            viewModel.kaydet(kayit_icerik: icerik)
            }
        
    }
    

}
