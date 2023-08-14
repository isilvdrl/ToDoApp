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
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kayitlarTableView.dataSource = self
        kayitlarTableView.delegate = self
        
        _ = viewModel.kayitListesi.subscribe(onNext: {liste in
            self.kayitListesi = liste
            self.kayitlarTableView.reloadData()
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.listele()
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
        self.viewModel.ara(searchText: searchText)
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
                self.viewModel.sil(kayit_id: kayit.kayit_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
