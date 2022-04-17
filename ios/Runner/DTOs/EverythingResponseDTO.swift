import Foundation

struct EverythingResponseDTO: Decodable {
  let status: String
  let totalResults: Int
  let articles: [ArticleDTO]
}

struct ArticleDTO: Decodable {
    let title: String
    let description: String
    let urlToImage : String?
    let url : String
    let publishedAt : String?
    let content : String?
    
    public func toArticle() -> Article {
        return Article.make(withTitle: title, descr: description, urlToImage: urlToImage, url: url, publishedAt: publishedAt, content: content)
    }
}
