import typealias Tuplé.Each

public extension Encoder {
  /// Encode key-value pairs.
  func encode<Key: CodingKey, each Value: Encodable>(
    _ pair: repeat (key: Key, value: each Value)
  ) throws {
    var container = container(keyedBy: Key.self)
    try container.encode(repeat each pair)
  }
}
