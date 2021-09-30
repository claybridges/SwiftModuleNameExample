func moduleName(for type: Any.Type) -> String {
  // parse module name from string that looks like "ModuleName.ClassName"
  if let subSequence = String(reflecting: type.self).split(separator: ".").first {
    return String(subSequence)
  } else {
    return ""
  }
}

print(moduleName(for: String.self)) // -> Swift

enum Test {}
print(moduleName(for: Test.self))   // -> SwiftModuleNameExample

// can even be embedded in a protocol

public protocol Module {}
extension Module {
  static var name: String { moduleName(for: Self.self) }
}

class ThisModule: Module {}

print(ThisModule.name)             // -> SwiftModuleNameExample
