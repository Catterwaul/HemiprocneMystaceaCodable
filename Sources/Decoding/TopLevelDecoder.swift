import protocol Combine.TopLevelDecoder

public extension TopLevelDecoder {
  /// Decodes an instance of the indicated type.
  func decode<Decodable: Swift.Decodable>(from input: Input) throws -> Decodable {
    try decode(Decodable.self, from: input)
  }
}
