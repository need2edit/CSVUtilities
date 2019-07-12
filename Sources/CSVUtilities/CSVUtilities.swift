public protocol CSVRowRepresentable {
    static func headers -> [String]
    static func columnValues -> [String]
}

extension Array where Element: CSVRowRepresentable {
    
    public func header() -> [String] {
        return Element.headers().joined(separator: ",")
    }
    
    public func rows() -> [String] {
        return self.map { $0.columnValues().joined(separator: ",") }
    }
    
    public func csv() -> String {
        return header() + "\r" + rows().joined(separator: "\r")
    }
}
