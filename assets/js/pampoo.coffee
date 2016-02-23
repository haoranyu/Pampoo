Lib = require './library.coffee'

window.Pampoo =
    cleanUp : (string) ->
        # Calling order matters
        string = Lib.replaceQuotes string
        string = Lib.punctuationTrans string
        string = Lib.addPunctuationSpaces string
        string = Lib.addEnglishChineseSpaces string
        string = Lib.addLanguageNumberSpaces string
        string = Lib.normalizeSpace string

    lib: Lib
