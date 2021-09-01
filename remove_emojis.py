#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import sys

emoji_pattern = re.compile(
    "["
    u"\U0001F600-\U0001F64F"  # emoticons
    u"\U0001F300-\U0001F5FF"  # symbols & pictographs
    u"\U0001F680-\U0001F6FF"  # transport & map symbols
    u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
    u"\U00002760-\U0000276F"  # emoticons
    "]+", flags=re.UNICODE
)

if len( sys.argv ) == 1:
    print( "Usage: remove_emojis.py <input_file> [<output_file>]" )
    quit()

filename = sys.argv[1]

if not filename:
    print( "FATAL: filename is not given" )
    quit()

text = open( filename, "r" ).read()

res = emoji_pattern.sub( r'', text )

if len( sys.argv ) == 3:
    output_filename = sys.argv[2]
    f = open( output_filename, "w" )
    f.write( res )
else:
    print( res )
