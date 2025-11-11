
extension Array where Element == String {
    func encoded() -> Data? {
        try? JSONEncoder().encode(self)
    }
}

extension Data {
    func decoded() -> [String]? {
        try? JSONDecoder().decode([String].self, from: self)
    }
}
