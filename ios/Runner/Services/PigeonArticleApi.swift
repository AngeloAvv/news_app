
import Flutter
import UIKit
import Alamofire

public class PigeonArticleApi: NSObject, ArticleApi {
    
    public func articles(completion: @escaping ([Article]?, FlutterError?) -> Void) {

        // TODO Define the token
        AF.request("https://newsapi.org/v2/everything?q=italy", headers: [
            "Authorization": "Bearer <token>",
        ])
          .validate()
          .responseDecodable(of: EverythingResponseDTO.self) { (response) in
              if let everythingResponse = response.value {
                  let articles : [Article] = everythingResponse.articles.map { $0.toArticle() }
                  completion(articles, nil)
              } else {
                  let errorResponse : AFError? = response.error
                  
                  completion(nil, FlutterError(code: String(errorResponse!.responseCode ?? 200), message: errorResponse!.errorDescription, details: errorResponse!.errorDescription))
              }
          }

    }

}
