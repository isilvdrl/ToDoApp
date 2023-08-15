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
        veritabaniKopyala()
        kayitListesi = kayitRepo.kayitListesi
    }
    func listele() {
        kayitRepo.listele()
        
    }
    func sil(kayit_id:Int) {
        kayitRepo.sil(kayit_id: kayit_id)
        kayitRepo.listele()
    }
    func ara(searchText:String) {
        kayitRepo.ara(searchText: searchText)
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDoDb", ofType: ".sqlite")
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDoDb.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path() ){
           print("veritabanı zaten var")
           
        }
        else{
          do{
              try fm.copyItem(atPath: bundleYolu! , toPath: veritabaniURL.path)
              
          }
          catch{
                kayitRepo.listele()
               
                  }
            
        }
        
    }
    
}
