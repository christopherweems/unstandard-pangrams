import lc_locale
import Foundation

public struct Pangrams {
    public static func all(for language: Locale.Language) -> [String] {
        switch language {
        case .english:
            return Self.english
            
        default:
            return []
        }
    }
    
    public static func random(in language: Locale.Language = .english) -> String {
        switch language {
        case .english, _:
            // missing languages fall through to english
            return Self.english.randomElement()!
        }
    }
    
}

extension Pangrams {
    internal static let english = Self.pangramList(resourceName: "English")
    
}

extension Pangrams {
    internal static func pangramList(resourceName: String) -> [String] {
        guard let listPath = Bundle.module.path(forResource: resourceName, ofType: "txt") else {
            fatalError("Bundle resource for `\(resourceName)` could not be found")
        }
        
        guard let listContents = try? String(contentsOfFile: listPath) else {
            fatalError("File at \(listPath) does not have string contents")
        }
        
        let pangrams = listContents.components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
        
        guard !pangrams.isEmpty else {
            fatalError("Pangram list is empty")
        }
        
        return pangrams
    }
    
}
