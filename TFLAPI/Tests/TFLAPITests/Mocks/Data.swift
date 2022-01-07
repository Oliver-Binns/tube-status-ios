import Foundation

extension Data {
    static func fromFile(named: String) throws -> Data {
        guard let path = Bundle.module
            .path(forResource: named, ofType: "json") else {
            fatalError("Could not find file in bundle")
        }
        let url = URL(fileURLWithPath: path)
        return try Data(contentsOf: url)
    }
}
