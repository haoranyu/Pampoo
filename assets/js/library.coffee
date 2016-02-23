_Regex = require './regex.coffee'

punctuationReplacement = (string) ->
    string
        .replace /,/g, '，'
        .replace /\./g, '。'
        .replace /;/g, '；'
        .replace /:/g, '：'
        .replace /\?/g, '？'
        .replace /!/g, '！'

module.exports =

    punctuationTrans: (string) ->
        string = string.replace _Regex.C_EP, (match) ->
            return punctuationReplacement match

        string = string.replace _Regex.QUOTES, (match, $1, i1) ->
            if _Regex.ENGLISH_PUNCTUATION.test string[i1-1]
                return ' ' + $1
            else
                return $1

        string.replace _Regex.N_EP_C, (match) ->
            return punctuationReplacement match


    addPunctuationSpaces: (string) ->
        string
            .replace _Regex.ENGLISH_PUNCTUATION, (match, $1, i1) ->
                if _Regex.CHINESE.test string[i1+1]
                    return $1 + ' '
                else if _Regex.CHINESE.test string[i1-1]
                    return $1 + ' '
                else if (string[i1+1]? and _Regex.LETTER.test string[i1+1]) and (string[i1-1]? and _Regex.LETTER.test string[i1-1])
                    return $1 + ' '
                else return $1

    addEnglishChineseSpaces: (string) ->
        string
            .replace _Regex.C_E, '$1 $2'
            .replace _Regex.E_C, '$1 $2'

    addLanguageNumberSpaces: (string) ->
        string
            .replace _Regex.C_N, '$1 $2'
            .replace _Regex.E_N, '$1 $2'
            .replace _Regex.N_C, '$1 $2'
            .replace _Regex.N_E, '$1 $2'

    ###
    # This function is MIT licensed
    # Copyright (C) 2013 Kelly Martin, http://kelly-martin.com
    # Source: https://github.com/kellym/
    ###
    replaceQuotes: (string) ->
        string
            .replace /'''/g, '\u2034'
            .replace /(\W|^)"(\S)/g, '$1\u201c$2'
            .replace /(\u201c[^"]*)"([^"]*$|[^\u201c"]*\u201c)/g, '$1\u201d$2'
            .replace /([^0-9])"/g,'$1\u201d'
            .replace /''/g, '\u2033'
            .replace /(\W|^)'(\S)/g, '$1\u2018$2'
            .replace /([a-z])'([a-z])/ig, '$1\u2019$2'
            .replace /((\u2018[^']*)|[a-z])'([^0-9]|$)/ig, '$1\u2019$3'
            .replace /(\u2018)([0-9]{2}[^\u2019]*)(\u2018([^0-9]|$)|$|\u2019[a-z])/ig, '\u2019$2$3'
            .replace /(\B|^)\u2018(?=([^\u2019]*\u2019\b)*([^\u2019\u2018]*\W[\u2019\u2018]\b|[^\u2019\u2018]*$))/ig, '$1\u2019'
            .replace /'/g, '\u2032'

    replaceBrackets: (string) ->
        string = string
            .replace _Regex.BRACKETS, (match, $1) ->
                if $1 is ')'
                    return '）'
                else return '（'

        string
            .replace _Regex.B_EP, (match, $1, $2) ->
                return $1 + punctuationReplacement $2
            .replace _Regex.EP_B, (match, $1, $2) ->
                return punctuationReplacement $1 + $2

    removeRepeatingPunctuation: (string) ->
        string = string
            .replace _Regex.CHINESE_PUNCTUATION, (match, $1) ->
                if $1.length is 1
                    return $1
                else
                    return $1[0]

    normalizeEllipsis: (string) ->
        string = string
            .replace _Regex.E_EL, '$1... '
        string
            .replace _Regex.C_EL, '$1……'


    normalizeSpace: (string) ->
        string = string
            .replace /\s+/g, ' '
        string
            .replace /\s/g, (match, i1) ->
                if (string[i1+1]?) and (_Regex.HANCHAR.test string[i1+1]) and (string[i1-1]?) and (_Regex.HANCHAR.test string[i1-1])
                    return ''
                else
                    return ' '
