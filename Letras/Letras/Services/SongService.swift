//
//  SongService.swift
//  Letras
//
//  Created by Ricardo Desiderio on 10/16/18.
//  Copyright © 2018 Radg. All rights reserved.
//

import Foundation

struct SongService {
    
    //Evita estar creando instancias de la clase para usar los métodos
    static let shared = SongService()
    
    //Cliente
    let client = Client(baseURLComponents: URLComponents(string: "https://api.lyrics.ovh")!)
    let jsonDecoder = JSONDecoder()
    
    /*
     -Recibe como parámetros el nombre de la canción y el autor, y también un closure
     -Se encarga de generar el path y obtener datos del cliente, después los
     decodifica (A JsonSong) y por último ejecuta el closure envíandole el texto de la canción
     */
    func getSongText(name: String, title: String, completion: @escaping (String?) -> Void) {
        let path = "/v1/" + name + "/" + title
        client.get(path: path) { (data) in
            guard let jsonSong = try? self.jsonDecoder.decode(JsonSong.self, from: data) else {print("Cant decode");return}
            completion(jsonSong.text)
        }
    }
    
}
