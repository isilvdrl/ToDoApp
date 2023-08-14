//
//  KayitDuzenleViewModel.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 11.08.2023.
//

import Foundation
class KayitDuzenleViewModel{
    
    var kayitRepo = KayitlarDaoRepository()
    
    func guncelle(kayit_id:Int,kayit_icerik:String) {
        kayitRepo.guncelle(kayit_id: kayit_id, kayit_icerik: kayit_icerik)
    }
    
}
