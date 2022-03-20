extension String {
    var isBinary: Bool {
        if isEmpty { return false }

        for character in self {
            if character != "0" && character != "1" {
                return false
            }
        }

        return true
    }
}
