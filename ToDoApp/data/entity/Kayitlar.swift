//
//  Kayit.swift
//  ToDoApp
//
//  Created by IŞIL VARDARLI on 1.08.2023.
//

import Foundation

class Kayitlar{
    init(kayit_id: Int? = nil, kayit_icerik: String? = nil) {
        self.kayit_id = kayit_id
        self.kayit_icerik = kayit_icerik
    }
    
    
    var kayit_id: Int?
    var kayit_icerik: String?
    
}
