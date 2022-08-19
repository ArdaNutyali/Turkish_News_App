//
//  Service.swift
//  TurkishNewsApp
//
//

import Foundation

func getNews(newsInput: String, completion: @escaping ([Article]) -> ()) {
    var urlString = ""
    
    if newsInput == K.NewsCategories.all {
        urlString = "https://newsapi.org/v2/top-headlines?country=tr&apiKey=58cb0c01a369472db198a0c524c51298"
    }
    else {
        urlString = "https://newsapi.org/v2/top-headlines?country=tr&category=\(newsInput)&apiKey=58cb0c01a369472db198a0c524c51298"
    }
    
    let url = URL(string: urlString)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { data, response, error in
        if error == nil && data != nil {
            let decoder = JSONDecoder()
            do {
                let parsingData = try decoder.decode(Welcome.self, from: data!)
                completion(parsingData.articles)
            } catch {
                print("Parsing Error!")
            }
        }
    }
    dataTask.resume()
}
