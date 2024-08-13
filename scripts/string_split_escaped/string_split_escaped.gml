// Feather disable all

/// @param string
/// @param delimiter
/// @param [removeEmpty=false]
/// @param [maxSplits=infinity]
/// @param [escapeCharacter=\]

function string_split_escaped(_string, _delimiter, _removeEmpty = false, _maxSplits = infinity, _escapeCharacter = "\\")
{
    _string = string_replace_all(
                  string_replace_all(
                      _string,
                      _escapeCharacter + _delimiter,
                      chr(0x01)
                  ),
                  _escapeCharacter + chr(0x01),
                  _escapeCharacter + _delimiter
              );
    
    var _split = string_split(_string, _delimiter, _removeEmpty, _maxSplits);
    var _i = 0;
    repeat(array_length(_split))
    {
        _split[_i] = string_replace_all(_split[_i], chr(0x01), _delimiter);
        ++_i;
    }
    
    return _split;
}