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
    
    let db:FMDatabase?
    init() {
      let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
      let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDoDb.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    func kaydet(kayit_icerik : String){
        db?.open()
        do{
        try db!.executeUpdate("INSERT INTO kayitlar(kayit_icerik ) VALUES (?)", values:[kayit_icerik])
        }
        catch{
            print(error.localizedDescription)
            }
        db?.close()
        
    }
    
    func guncelle(kayit_id:Int,kayit_icerik:String) {
        db?.open()
        do{
        try db!.executeUpdate("UPDATE kayitlar SET kayit_icerik = ? WHERE kayit_id = ?", values:[ kayit_icerik ,kayit_id ])
        }
        catch{
            print(error.localizedDescription)
            }
        db?.close()
    }
    
    func listele() {
      

        db?.open()
        var liste = [Kayitlar]()
        do{
            let result = try db!.executeQuery("SELECT * FROM kayitlar", values: nil)
            while result.next(){
                let kayit_id = Int(result.string(forColumn: "kayit_id"))!
                let kayit_icerik = result.string(forColumn: "kayit_icerik")!
                                      
                let kayit = Kayitlar(kayit_id: kayit_id,kayit_icerik: kayit_icerik)
                liste.append(kayit)
                                                   
            }
            kayitListesi.onNext(liste)
        }
        catch{
            print(error.localizedDescription)
             
        }
        
        db?.close()
       
    }
    
    func sil(kayit_id:Int) {
        db?.open()
        do{
        try db!.executeUpdate("DELETE FROM kayitlar WHERE kayit_id = ?", values:[kayit_id])
        }
        catch{
            print(error.localizedDescription)
            }
        db?.close()
    }
    
    func ara(searchText:String) {
        db?.open()
        var liste = [Kayitlar]()
        do{
            let result = try db!.executeQuery("SELECT * FROM kayitlar WHERE kayit_icerik LIKE '%\(searchText)%'", values: nil)
            while result.next(){
                let kayit_id = Int(result.string(forColumn: "kayit_id"))!
                let kayit_icerik = result.string(forColumn: "kayit_icerik")!
                                      
                let kayit = Kayitlar(kayit_id: kayit_id,kayit_icerik: kayit_icerik)
                liste.append(kayit)
                                  
                 
            }
            kayitListesi.onNext(liste)//tetikleme
        }
        catch{
            print(error.localizedDescription)
             
        }
        
        db?.close()
    }
    
    
}
