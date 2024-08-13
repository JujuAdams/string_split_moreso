<h1 align="center">string_split_moreso</h1>

<p align="center">Extended string_split() functions for GameMaker</p>

&nbsp;

### `string_split_escaped()`

GameMaker's native `string_split()` but with additional support for escape characters.

Examples:
```
string_split_escaped("0#1",     "#")  ->  ["0", "1"]
string_split_escaped("0\#1",    "#")  ->  ["0#1"]
string_split_escaped("0\\\\#1", "#")  ->  ["0\", "1"]
```

&nbsp;

### `string_split_open_close()`

GameMaker's native `string_split()` but using an open and close delimiter. This is useful for handling BBCode-style formatting tags etc.  Returned array will have content found between the open and close delimiters stored in odd-numbered indexes in the array.

**N.B.** Tags cannot be nested inside other tags.

Examples:
```
string_split_open_close("0[1]2",       "[", "]")  ->  ["0", "1", "2"]
string_split_open_close("[1]",         "[", "]")  ->  ["", "1", ""]
string_split_open_close("0[1][3][5]6", "[", "]")  ->  ["0", "1", "", "3", "", "5", "6"]
```

&nbsp;

### `string_split_open_close_escaped()`

GameMaker's native `string_split()` but using an open and close delimiter and supporting escape characters. This is useful for handling BBCode-style formatting tags etc.  Returned array will have content found between the open and close delimiters stored in odd-numbered indexes in the array.

**N.B.** Tags cannot be nested inside other tags.

Examples:
```
string_split_open_close("0[1]2",       "[", "]")  ->  ["0", "1", "2"]
string_split_open_close("[1]",         "[", "]")  ->  ["", "1", ""]
string_split_open_close("\\[0]",       "[", "]")  ->  ["[0]"]
string_split_open_close("0[1][3][5]6", "[", "]")  ->  ["0", "1", "", "3", "", "5", "6"]
```
