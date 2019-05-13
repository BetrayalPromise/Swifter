import Foundation

extension Character {
    
    public var isEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        let scalarValue = String(self).unicodeScalars.first!.value
        switch scalarValue {
            // Special Characters
        case 0x3030, 0x00AE, 0x00A9,
             // Emoticons
        0x1D000...0x1F77F,
            // Misc symbols and Dingbats
        0x2100...0x27BF,
            // Variation Selectors
        0xFE00...0xFE0F,
            // Supplemental Symbols and Pictographs
        0x1F900...0x1F9FF:
            return true
        default:
            return false
        }
    }
    
}
