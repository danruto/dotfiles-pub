# Append to SKHD to use bash

`brew edit skhd

 <dict>
    <key>PATH</key>
    <string>#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
    <key>SHELL</key>
    <string>/bin/bash</string>
</dict>
`
``````
