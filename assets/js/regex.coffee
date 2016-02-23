_ = module.exports =
    # Base expressions
    CHINESE: /([\u4e00-\u9fa5]+)/g
    ENGLISH: /([a-zA-Z]+)/g
    NUMBER: /([+-]?\d+\.?\d*)/g
    HANCHAR: /[\u4e00-\u9fa5]/
    LETTER: /[a-zA-Z]/
    CHINESE_PUNCTUATION: /([，。；：？ ！])/g
    ENGLISH_PUNCTUATION: /([,\.;:\?!])/g
    QUOTES: /([“”])/g

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
