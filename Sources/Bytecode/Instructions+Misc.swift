// cSpell:ignore instrsize oparg

extension Instruction {

  // MARK: - Constants

  /// Each instruction is 2 bytes in size.
  public static let byteSize = 2

  /// Maximum argument for an single instruction.
  public static let maxArgument = 0xff // (the same value as UInt8.max)

  /// Maximum argument for an instruction with 1x `extendedArg` before it.
  public static let maxExtendedArgument1 = 0xffff

  /// Maximum argument for an instruction with 2x `extendedArg` before it.
  public static let maxExtendedArgument2 = 0xff_ffff

  /// Maximum argument for an instruction with 3x `extendedArg` before it.
  public static let maxExtendedArgument3 = 0xffff_ffff

  // MARK: - Extend arg

  /// Handle `extendedArg` instruction.
  ///
  /// - Parameter base: Current value (before extension)
  /// - Parameter base: Value used to extend `base`
  public static func extend(base: Int, arg: UInt8) -> Int {
    return (base << UInt8.bitWidth) | Int(arg)
  }

  /// static int
  /// instrsize(unsigned int oparg)
  internal static func minExtendedArgCountNeeded(toEncode extendedArg: Int) -> Int {
    return
      extendedArg <= 0xff ? 1 :
      extendedArg <= 0xffff ? 2 :
      extendedArg <= 0xffffff ? 3 :
      4
  }

  // MARK: - Function flags

  // Normally this would be generated by Elsa,
  // but Elsa does not support option sets.

  /// Function properties used in `MakeFunction` instruction.
  public struct FunctionFlags: OptionSet, Equatable, CustomStringConvertible {

    public let rawValue: UInt8

    /// 0x01
    public static let hasPositionalArgDefaults = FunctionFlags(rawValue: 0x01)
    /// 0x02
    public static let hasKwOnlyArgDefaults = FunctionFlags(rawValue: 0x02)
    /// 0x04
    public static let hasAnnotations = FunctionFlags(rawValue: 0x04)
    /// 0x08
    public static let hasFreeVariables = FunctionFlags(rawValue: 0x08)

    public var description: String {
      var flags = ""

      func appendIfSet(_ flag: FunctionFlags, name: String) {
        if self.contains(flag) {
          if flags.any {
            flags += ", "
          }

          flags.append(name)
        }
      }

      appendIfSet(.hasPositionalArgDefaults, name: "hasPositionalArgDefaults")
      appendIfSet(.hasKwOnlyArgDefaults, name: "hasKwOnlyArgDefaults")
      appendIfSet(.hasAnnotations, name: "hasAnnotations")
      appendIfSet(.hasFreeVariables, name: "hasFreeVariables")

      return "FunctionFlags(\(flags))"
    }

    public init(rawValue: UInt8) {
      self.rawValue = rawValue
    }
  }

  // MARK: - UnpackExArg

  /// Helper for handling the `unpackEx` instruction argument.
  ///
  /// The idea is that `countAfter` always goes into previous
  /// `extendedArg` instruction.
  public struct UnpackExArg: Equatable, CustomStringConvertible {

    public let value: Int

    public var countBefore: Int {
      return self.value & 0xff
    }

    public var countAfter: Int {
      return self.value >> 8
    }

    public var description: String {
      let before = self.countBefore
      let after = self.countAfter
      return "UnpackExArg(countBefore: \(before), countAfter: \(after))"
    }

    public init(value: Int) {
      self.value = value
    }

    public init(countBefore: Int, countAfter: Int) {
      precondition(0 <= countBefore && countBefore <= 0xff)
      precondition(0 <= countAfter && countAfter <= 0xff_ffff)
      self.value = countAfter << 8 | countBefore
    }
  }
}
