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

filename = sys.argv[1]

text = open( filename, "r" ).read()

print( emoji_pattern.sub(r'', text))