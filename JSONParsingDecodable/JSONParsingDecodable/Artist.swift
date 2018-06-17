/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

struct Artist2: Decodable {
    let name: String
    let bio: String
}

struct Artist: Decodable {
    let artists: [[String: String]]
}

class ArtistResponse {
    
    static func artistsFromBundle() -> [Artist2] {
        
        var artists = [Artist2]()
        
        guard let url = Bundle.main.url(forResource: "Artists2", withExtension: "json") else {
            return artists
        }
        
        do {
            let data = try Data(contentsOf: url, options: .alwaysMapped)
            print("Data is------------------------")
            print(data)
            //For artists.json
//            let artists = try JSONDecoder().decode(Artist.self, from: data)
            
             artists = try JSONDecoder().decode([Artist2].self, from: data)
            //print(artists)
            
            for artist in artists {
                print(artist.name)
            }
          
        } catch {
            print("In catch")
            return artists
        }
        
        return artists
    }
    
}

