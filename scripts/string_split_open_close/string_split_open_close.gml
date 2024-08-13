// Feather disable all

/// @param string
/// @param openDelimiter
/// @param closeDelimiter

function string_split_open_close(_string, _open, _close)
{
    var _split = string_split(_string, _open);
    var _i = array_length(_split)-1;
    repeat(array_length(_split)-1)
    {
        var _substring = _split[_i];
        
        var _closeSplit = string_split(_substring, _close, false, 1);
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
    
    return _split;
}