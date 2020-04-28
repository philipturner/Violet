public typealias SourceLine = UInt16
public typealias SourceColumn = UInt16

public struct SourceLocation: Equatable {

  /// Initial location.
  public static var start: SourceLocation {
    return SourceLocation(line: 1, column: 0)
  }

  /// Line in file starting from 1.
  public private(set) var line: SourceLine

  /// Column in line starting from 0.
  public private(set) var column: SourceColumn

  public init(line: SourceLine, column: SourceColumn) {
    self.line = line
    self.column = column
  }

  public mutating func advanceLine() {
    self.line += 1
    self.column = 0
  }

  public mutating func advanceColumn() {
    self.column += 1
  }

  public var next: SourceLocation {
    let line = self.line
    let column = self.column + 1
    return SourceLocation(line: line, column: column)
  }
}

extension SourceLocation: CustomStringConvertible {
  public var description: String {
    return "\(self.line):\(self.column)"
  }
}
