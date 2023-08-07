//
//  ViewController.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var kayitlarTableView: UITableView!
    
    var kayitListesi = [Kayitlar]()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kayitlarTableView.dataSource = self
        kayitlarTableView.delegate = self
        
        let k1 = Kayitlar(kayit_id: 1,kayit_icerik: "su iç")
        let k2 = Kayitlar(kayit_id: 2,kayit_icerik: "dondurma al")
        let k3 = Kayitlar(kayit_id: 3,kayit_icerik: "mama sipariş et")
        kayitListesi.append(k1)
        kayitListesi.append(k2)
        kayitListesi.append(k3)
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
        
    }
    
}

extension Anasayfa: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Madde Ara: \(searchText)")
    }
}

extension Anasayfa: UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kayitListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kayit = kayitListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kayitlarHucre") as! KayitlarHucre
        hucre.labelKayitIcerik.text = kayit.kayit_icerik
        
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kayit = kayitListesi[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: kayit)
        tableView.deselectRow(at: indexPath, animated: true)//seçili tutmasın
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
           contextualAction,view,bool in //_,_,_ in olarak kullanılbilir
           let kayit = self.kayitListesi[indexPath.row]
            
            let alert = UIAlertController(title: "SİLME İŞLEMİ", message: "\(kayit.kayit_icerik!) silinsin mi?", preferredStyle: .alert)
           
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                print("Kayıt sil: \(kayit.kayit_icerik!)")
            }
            alert.addAction(evetAction)
            
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
