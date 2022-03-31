//
//  Articles.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation

// MARK: - Articles
struct Articles: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let entries: [Entry]
}

// MARK: - Entry
struct Entry: Codable {
    let id, slug: String
    let article: [EntryArticle]
    let keyTalkingPoints: [KeyTalkingPoint]
    let items: [EntryItem]

    enum CodingKeys: String, CodingKey {
        case id, slug, article
        case keyTalkingPoints = "key_talking_points"
        case items
    }
}

// MARK: - EntryArticle
struct EntryArticle: Codable {
    let eyebrow: [Eyebrow]
    let title, shortTitle: String
    let featuredAsset: [FeaturedAsset]
    let timestamp: String
    let author: [Author]
    let dek: String
    let primaryTopic, subTopics: [Eyebrow]?

    enum CodingKeys: String, CodingKey {
        case eyebrow, title
        case shortTitle = "short_title"
        case featuredAsset = "featured_asset"
        case timestamp, author, dek
        case primaryTopic = "primary_topic"
        case subTopics = "sub_topics"
    }
}

// MARK: - Author
struct Author: Codable {
    let firstName: FirstName
    let lastName: LastName
    let role: JobTitle?
    let jobTitle: JobTitle?
    let location: Location?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case jobTitle = "job_title"
        case role
        case location
    }
}

enum FirstName: String, Codable {
    case cyril = "Cyril"
    case dharnell = "Dharnell"
    case jane = "Jane"
}

enum JobTitle: String, Codable {
    case ipsumLoremRole = "Ipsum Lorem Role"
    case salesAgent = "Sales Agent"
    case webDeveloper = "Web Developer"
}

enum LastName: String, Codable {
    case abluyen = "Abluyen"
    case arpin = "Arpin"
    case doe = "Doe"
}

enum Location: String, Codable {
    case quezonCity = "Quezon City"
    case the5ThAvenueMansion = "5th Avenue Mansion"
}

// MARK: - Eyebrow
struct Eyebrow: Codable {
    let title: String
}

// MARK: - FeaturedAsset
struct FeaturedAsset: Codable {
    let url: String
    let width, height: Int
}

// MARK: - EntryItem
struct EntryItem: Codable {
    let articleBody: String?
    let contentCarousel: [ContentCarousel]?
    let contentCards: [ContentCard]?
    let quote: [Quote]?
    let inlineImage: [InlineImage]?
    let keyTalkingPoints: [KeyTalkingPoint]?
    let inlineGallery: [InlineGallery]?
    let video: [InlineImage]?

    enum CodingKeys: String, CodingKey {
        case articleBody = "article_body"
        case contentCarousel = "content_carousel"
        case contentCards, quote
        case inlineImage = "inline_image"
        case keyTalkingPoints = "key_talking_points"
        case inlineGallery = "inline_gallery"
        case video
    }
}

// MARK: - ContentCard
struct ContentCard: Codable {
    let item: [ContentCardItem]
    let briefComment: JSONNull?

    enum CodingKeys: String, CodingKey {
        case item
        case briefComment = "brief_comment"
    }
}

// MARK: - ContentCardItem
struct ContentCardItem: Codable {
    let collectionItem, articleCardItem: [Item]?
    let takeawayItem: [TakeawayItem]?
}

// MARK: - Item
struct Item: Codable {
    let id, slug: String
    let article: [EntryArticle]?
    let displayType: String?
    let collection: [ArticleCardItemCollection]?

    enum CodingKeys: String, CodingKey {
        case id, slug, article
        case displayType = "display_type"
        case collection
    }
}

// MARK: - ArticleCardItemCollection
struct ArticleCardItemCollection: Codable {
    let eyebrow: [Eyebrow]
    let title: String
    let featuredAsset: [FeaturedAsset]
    let timestamp: String
    let author: [Author]
    let dek, articleSlug, articleTitle: String
    let note: Note?

    enum CodingKeys: String, CodingKey {
        case eyebrow, title
        case featuredAsset = "featured_asset"
        case timestamp, author, dek
        case articleSlug = "article_slug"
        case articleTitle = "article_title"
        case note
    }
}

// MARK: - Note
struct Note: Codable {
    let author: Author
    let content: String
}

// MARK: - ContentCarousel
struct ContentCarousel: Codable {
    let carouselTitle, carouselDescription, carouselContentType: String
    let collections: [ContentCarouselCollection]?
    let takeaways: [JSONAny]
    let articles: [ContentCarouselArticle]?

    enum CodingKeys: String, CodingKey {
        case carouselTitle = "carousel_title"
        case carouselDescription = "carousel_description"
        case carouselContentType = "carousel_content_type"
        case collections, takeaways, articles
    }
}

// MARK: - ContentCarouselArticle
struct ContentCarouselArticle: Codable {
    let id, slug: String
    let article: [EntryArticle]
}

// MARK: - ContentCarouselCollection
struct ContentCarouselCollection: Codable {
    let id, slug: String
    let collection: [ArticleCardItemCollection]
}

// MARK: - InlineGallery
struct InlineGallery: Codable {
    let inlineGalleryTitle: String
    let inlineGalleryTable: [InlineImage]
}

// MARK: - InlineImage
struct InlineImage: Codable {
    let image: [FeaturedAsset]?
    let caption: String
    let credit: String?
    let title: String?
    let url: [URLElement]?
}

// MARK: - URLElement
struct URLElement: Codable {
    let link: String
    let thumbnail: [FeaturedAsset]?
    let duration: String?
}

// MARK: - KeyTalkingPoint
struct KeyTalkingPoint: Codable {
    let title: String
    let items: [KeyTalkingPointItem]
}

// MARK: - KeyTalkingPointItem
struct KeyTalkingPointItem: Codable {
    let content: String
}

// MARK: - Quote
struct Quote: Codable {
    let content, fullName, role: String

    enum CodingKeys: String, CodingKey {
        case content
        case fullName = "full_name"
        case role
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
