//
//  KayitEkleViewModel.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 11.08.2023.
//

import Foundation
class KayitEkleViewModel{
    
    var kayitRepo = KayitlarDaoRepository()
  
    func kaydet(kayit_icerik : String){
        kayitRepo.kaydet(kayit_icerik: kayit_icerik)
        
    }
}
