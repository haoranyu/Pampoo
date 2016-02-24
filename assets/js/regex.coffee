BASE_EXPRESSIONS =
    ENGLISH: /([a-zA-Z]+)/g
    NUMBER: /([+-]?\d+\.?\d*)/g
    HANCHAR: /[\u4e00-\u9fa5]/
    LETTER: /[a-zA-Z]/
    CHINESE_PUNCTUATION: /([，。；：？ ！]+)/g
    ENGLISH_PUNCTUATION: /([,\.;:\?!]+)/g
    QUOTES: /([“”])/g
    BRACKETS: /([\(\)])/g
    CHINESE: /([\u4e00-\u9fa5]+)/g
    ELLIPSIS: /([\.]{3,})|([…]+)/g

FUNCTIONAL_EXPRESSIONS =
    C_EP: ///
        #{BASE_EXPRESSIONS.CHINESE.source}
        #{BASE_EXPRESSIONS.ENGLISH_PUNCTUATION.source}
    ///g

    C_E: ///
        #{BASE_EXPRESSIONS.CHINESE.source}
        #{BASE_EXPRESSIONS.ENGLISH.source}
    ///g

    E_C: ///
        #{BASE_EXPRESSIONS.ENGLISH.source}
        #{BASE_EXPRESSIONS.CHINESE.source}
    ///g

    E_N: ///
        #{BASE_EXPRESSIONS.ENGLISH.source}
        #{BASE_EXPRESSIONS.NUMBER.source}
    ///g

    N_E: ///
        #{BASE_EXPRESSIONS.NUMBER.source}
        #{BASE_EXPRESSIONS.ENGLISH.source}
    ///g

    C_N: ///
        #{BASE_EXPRESSIONS.CHINESE.source}
        #{BASE_EXPRESSIONS.NUMBER.source}
    ///g

    N_C: ///
        #{BASE_EXPRESSIONS.NUMBER.source}
        #{BASE_EXPRESSIONS.CHINESE.source}
    ///g

    N_EP_C: ///
        #{BASE_EXPRESSIONS.NUMBER.source}
        #{BASE_EXPRESSIONS.ENGLISH_PUNCTUATION.source}
        #{BASE_EXPRESSIONS.CHINESE.source}
    ///g

    B_EP: ///
        #{BASE_EXPRESSIONS.BRACKETS.source}
        #{BASE_EXPRESSIONS.ENGLISH_PUNCTUATION.source}
    ///g

    EP_B: ///
        #{BASE_EXPRESSIONS.ENGLISH_PUNCTUATION.source}
        #{BASE_EXPRESSIONS.BRACKETS.source}
    ///g

    C_EL: ///
        #{BASE_EXPRESSIONS.CHINESE.source}
        #{BASE_EXPRESSIONS.ELLIPSIS.source}
    ///g

    E_EL: ///
        #{BASE_EXPRESSIONS.ENGLISH.source}
        #{BASE_EXPRESSIONS.ELLIPSIS.source}
    ///g

shallowCopy = (objs...) ->
    for obj in (objs.slice 1)
        for key, val of obj
            objs[0][key] = val

    return objs[0]

module.exports = shallowCopy BASE_EXPRESSIONS, FUNCTIONAL_EXPRESSIONS
