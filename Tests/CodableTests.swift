import Foundation
import HMCodable
import Testing

struct CodableTests {
  @Test func encodeAndDecode() throws {
    let coatable = Coatable(🥼: 0, 🧥: "🧥")
    #expect(
      try JSONDecoder().decode(from: JSONEncoder().encode(coatable))
      ==
      coatable
    )
  }
}

private struct Coatable: Equatable {
  let 🥼: Int
  let 🧥: String
}

extension Coatable: Codable {
  private enum CodingKey: Swift.CodingKey { case 🥼, 🧥 }

  init(from decoder: any Decoder) throws {
    self = try decoder[(CodingKey.🥼, .🧥), Self.init]
  }

  func encode(to encoder: any Encoder) throws {
    try encoder.encode(
      (CodingKey.🥼, 🥼),
      (key: .🧥, value: 🧥)
    )
  }
}
