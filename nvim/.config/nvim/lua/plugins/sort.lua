require("sort").setup({
    -- Input configuration here.
    delimiters = {
        ',', '|', ';', ':', 's', -- Space
        't' -- Tab
    }
    -- Refer to the configuration section below for options.

})

-- :[range]Sort[!] [delimiter][b][i][n][o][u][x]

-- With [!] the sort order is reversed.
-- With [delimiter] the delimiter is manually set instead of iterating over config.delimiters and sorting by the highest priority delimiter with results. Valid delimiters are:
-- Any punctuation character (!, ?, &, ...), matching the %p lua pattern character class.
-- s: Space
-- t: Tab
-- With [b] sorting is done on the first binary number in the word.
-- With [i] case is ignored.
-- With [n] sorting is done on the first decimal number in the word.
-- With [o] sorting is done on the first octal number in the word.
-- With [u] only keep the first instance of words within selection. Note leading and trailing white space isn't considered when testing for uniqueness.
-- With [x] sorting is done on the first hexadecimal number the word. A leading 0x or 0X is ignored


