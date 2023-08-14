//
//  KayitlarDaoRepository.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 11.08.2023.
//

import Foundation
import RxSwift

class KayitlarDaoRepository{
    
    var kayitListesi = BehaviorSubject<[Kayitlar]>(value: [Kayitlar]())
    
    func kaydet(kayit_icerik : String){
        print("Kaydedilen:  \(kayit_icerik)")
        
    }
    
    func guncelle(kayit_id:Int,kayit_icerik:String) {
        print("Güncellendi : \(kayit_id)-\(kayit_icerik)")
    }
    
    func listele() {
        var liste = [Kayitlar]()
        let k1 = Kayitlar(kayit_id: 1,kayit_icerik: "su iç")
        let k2 = Kayitlar(kayit_id: 2,kayit_icerik: "dondurma al")
        let k3 = Kayitlar(kayit_id: 3,kayit_icerik: "mama sipariş et")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kayitListesi.onNext(liste)
    }
    
    func sil(kayit_id:Int) {
        print("Kayıt sil: \(kayit_id)")
    }
    
    func ara(searchText:String) {
        print("Madde Ara: \(searchText)")
    }
    
    
}
