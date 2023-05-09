setlocal iskeyword=@,48-57,_,192-255,#,-
syn keyword sshalg ssh-rsa
hi def link sshalg Identifier

"syntax match sshknownhostkey "AAAA[.*][=]\{0,2}"
"hi def link sshknowhostkey Special

syn match sshknownhostip "\<\(\d\{1,3}\.\)\{3}\d\{1,3}\>"
hi def link sshknownhostip Constant
