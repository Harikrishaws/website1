Using this file http://code.google.com/p/jquery-speedtest/downloads/detail?name=100MB.txt

This is one line full of `0`s, so there are `104857600` `0`s.

    wget http://jquery-speedtest.googlecode.com/files/100MB.txt

`main.m` reads the whole file at once. Doing so it occupies more than 200MB of memory (100MB for the `NSString`, another 100MB for the `char` array), as you can see here http://d.pr/i/jopC

`main_memory_mapped.m` maps the file in-memory, incrementally reading it; therefore its far less memory aggressive, as you can see here http://d.pr/i/YYzi