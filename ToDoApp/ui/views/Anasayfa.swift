//
//  ViewController.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    @IBAction func buttonDetail(_ sender: Any) {
        let kayit = Kayitlar(kayit_id: 1 ,kayit_icerik: "su iç")
        performSegue(withIdentifier: "toDetail", sender: kayit)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
           if let kayit = sender as? Kayitlar{
               let gidilecekVC = segue.destination as! KayitDuzenle
               gidilecekVC.kayit = kayit }
            
        }
        
    }}

