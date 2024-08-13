show_debug_message(string_split_escaped("#1#2\\#3\\\\#4##5", "#"));
show_debug_message(string_split_open_close("[2]", "[", "]"));
show_debug_message(string_split_open_close("1[2]3", "[", "]"));
show_debug_message(string_split_open_close("1[2]3[4]5", "[", "]"));
show_debug_message(string_split_open_close("1[2][3]4", "[", "]"));
show_debug_message(string_split_open_close("1[2[3]4]5", "[", "]"));
show_debug_message(string_split_open_close_escaped("[2\\]]", "[", "]"));