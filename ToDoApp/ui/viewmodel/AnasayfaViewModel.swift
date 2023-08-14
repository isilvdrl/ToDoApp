//
//  AnasayfaViewModel.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 11.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    
    var kayitRepo = KayitlarDaoRepository()
    var kayitListesi = BehaviorSubject<[Kayitlar]>(value: [Kayitlar]())
    init() {
        kayitListesi = kayitRepo.kayitListesi
    }
    func listele() {
        kayitRepo.listele()
        
    }
    func sil(kayit_id:Int) {
        kayitRepo.sil(kayit_id: kayit_id)
    }
    func ara(searchText:String) {
        kayitRepo.ara(searchText: searchText)
    }
    
}
