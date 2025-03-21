public extension KeyedEncodingContainerProtocol {
  /// Encode key-value pairs.
  mutating func encode<each Value: Swift.Encodable>(
    _ pair: repeat (key: Key, value: each Value)
  ) throws {
    repeat try encode((each pair).value, forKey: (each pair).key)
  }
}
