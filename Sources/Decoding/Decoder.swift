import typealias Tuplé.Each

public extension Decoder {
  /// Decode values for keys.
  /// - Parameters:
  ///   - key: `CodingKey` instances, matching the arguments.
  ///   - makeValue: A function whose arguments are the decoded values.
  /// - Bug: There is no way to break this apart, not requiring a closure,
  ///   due to various parameter pack bugs.
  subscript<each Parameter: Swift.Decodable, Key: CodingKey, Value>(
    key: (repeat Each<Key, each Parameter>),
    _ makeValue: (repeat each Parameter) -> Value
  ) -> Value {
    get throws {
      let argument: (repeat each Parameter) = try decode(keys: (repeat each key))
      return makeValue(repeat each argument)
    }
  }

  /// Decode values for keys.
  /// - Bug: This should be a subscript. That compiles, but is not callable.
  func decode<each Decodable: Swift.Decodable, Key: CodingKey>(
    keys key: (repeat Each<Key, each Decodable>)
  ) throws -> (repeat each Decodable) {
    try container(keyedBy: Key.self).decode(keys: (repeat each key))
  }
}
