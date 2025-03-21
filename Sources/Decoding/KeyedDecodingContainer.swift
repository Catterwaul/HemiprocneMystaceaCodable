import typealias Tuplé.Each

public extension KeyedDecodingContainerProtocol {
  /// Decode, relying on the return type, to avoid having to explicitly use a metatype argument.
  subscript<Decodable: Swift.Decodable>(key: Key) -> Decodable {
    get throws { try decode(Decodable.self, forKey: key) }
  }
}

public extension KeyedDecodingContainer {
  /// Decode values for keys.
  /// - Bug: This should be a subscript. That compiles, but is not callable.
  /// - Bug: This will not compile for `KeyedDecodingContainerProtocol`.
  func decode<each Decodable: Swift.Decodable>(
    keys key: (repeat Each<Key, each Decodable>)
  ) throws -> (repeat each Decodable) {
    (repeat try self[each key])
  }
}
