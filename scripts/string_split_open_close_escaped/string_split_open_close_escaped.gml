// Feather disable all

/// GameMaker's native string_split() but using an open and close delimiter and supporting escape
/// characters. This is useful for handling BBCode-style formatting tags etc.  Returned array will
/// have content found between the open and close delimiters stored in odd-numbered indexes in the
/// array.
/// 
/// N.B. Tags cannot be nested inside other tags.
/// 
/// Examples:
///     string_split_open_close("0[1]2",       "[", "]")  ->  ["0", "1", "2"]
///     string_split_open_close("[1]",         "[", "]")  ->  ["", "1", ""]
///     string_split_open_close("\\[0]",       "[", "]")  ->  ["[0]"]
///     string_split_open_close("0[1][3][5]6", "[", "]")  ->  ["0", "1", "", "3", "", "5", "6"]
/// 
/// @param string
/// @param openDelimiter
/// @param closeDelimiter
/// @param [escapeCharacter=\]

function string_split_open_close_escaped(_string, _open, _close, _escapeCharacter = "\\")
{
    var _split = string_split_escaped(_string, _open, undefined, undefined, _escapeCharacter);
    var _i = array_length(_split)-1;
    repeat(array_length(_split)-1)
    {
        var _substring = _split[_i];
        
        var _closeSplit = string_split_escaped(_substring, _close, false, 1, _escapeCharacter);
        if (array_length(_closeSplit) > 1)
        {
            _split[_i] = _closeSplit[0];
            array_insert(_split, _i+1, _closeSplit[1]);
        }
        else
        {
            if (_i < array_length(_split)-1)
            {
                array_delete(_split, _i, 1);
                _split[_i] = _closeSplit[0] + _open + _split[_i];
            }
            else
            {
                _split[_i] = _closeSplit[0];
            }
        }
        
        --_i;
    }
    
    //Strip out escapes for \]
    _split[0] = string_replace_all(
                    string_replace_all(
                        string_replace_all(
                            _split[0],
                            _escapeCharacter + _close,
                            chr(0x01)
                        ),
                        _escapeCharacter + chr(0x01),
                        _escapeCharacter + _close
                    ),
                    chr(0x01),
                    _close
                );
    
    return _split;
}