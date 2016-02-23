Lib = require './library.coffee'

window.Pampoo =
    cleanUp : (string) ->
        # Calling order matters
        string = Lib.replaceQuotes string
        string = Lib.replaceBrackets string
        string = Lib.normalizeEllipsis string
        string = Lib.punctuationTrans string
        string = Lib.addPunctuationSpaces string
        string = Lib.addEnglishChineseSpaces string
        string = Lib.addLanguageNumberSpaces string
        string = Lib.normalizeSpace string
        string = Lib.removeRepeatingPunctuation string

    lib: Lib
