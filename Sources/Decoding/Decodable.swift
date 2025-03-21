import typealias Tuplé.Each
private import Foundation

public extension Decodable {
  /// - Parameter codingDictionary: `CodingKey`s paired with their values.
  init(codingDictionary: [String: Any]) throws {
    self = try JSONDecoder().decode(
      from: JSONSerialization.data(withJSONObject: codingDictionary)
    )
  }
}
