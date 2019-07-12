import Foundation

public protocol CSVRowRepresentable {
    static func headers() -> [String]
    func columnValues() -> [String]
}

extension CSVRowRepresentable {
    var sanitizedColumns: [String] {
        return columnValues().map { $0.replacingOccurrences(of: ",", with: "\",\"") }
    }
}

extension Array where Element: CSVRowRepresentable {
    
    public func header() -> String {
        return Element.headers().joined(separator: ",")
    }
    
    public func rows() -> [String] {
        return self.map { $0.sanitizedColumns.joined(separator: ",") }
    }
    
    public func csv() -> String {
        return header() + "\r" + rows().joined(separator: "\r")
    }
}
