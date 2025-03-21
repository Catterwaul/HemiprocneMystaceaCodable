import HMCodable
import Testing

struct DecodableTests {
  struct Init {
    @Test func codingDictionary() throws {
      struct 🐈: Decodable { let mood: String }
      let mood = "😺"
      #expect(
        try 🐈(codingDictionary: ["mood": mood]).mood
        ==
        mood
      )
    }
  }
}
