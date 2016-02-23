_ = module.exports =
    # Base expressions
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
Object.assign _,
    # Funcational expressions
    C_EP: ///
        #{_.CHINESE.source}
        #{_.ENGLISH_PUNCTUATION.source}
    ///g

    C_E: ///
        #{_.CHINESE.source}
        #{_.ENGLISH.source}
    ///g

    E_C: ///
        #{_.ENGLISH.source}
        #{_.CHINESE.source}
    ///g

    E_N: ///
        #{_.ENGLISH.source}
        #{_.NUMBER.source}
    ///g

    N_E: ///
        #{_.NUMBER.source}
        #{_.ENGLISH.source}
    ///g

    C_N: ///
        #{_.CHINESE.source}
        #{_.NUMBER.source}
    ///g

    N_C: ///
        #{_.NUMBER.source}
        #{_.CHINESE.source}
    ///g

    N_EP_C: ///
        #{_.NUMBER.source}
        #{_.ENGLISH_PUNCTUATION.source}
        #{_.CHINESE.source}
    ///g

    B_EP: ///
        #{_.BRACKETS.source}
        #{_.ENGLISH_PUNCTUATION.source}
    ///g

    EP_B: ///
        #{_.ENGLISH_PUNCTUATION.source}
        #{_.BRACKETS.source}
    ///g

    C_EL: ///
        #{_.CHINESE.source}
        #{_.ELLIPSIS.source}
    ///g

    E_EL: ///
        #{_.ENGLISH.source}
        #{_.ELLIPSIS.source}
    ///g
