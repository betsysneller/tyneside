corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}IP-SUB)
AND (IP-SUB idomsfirst {2}C)

add_internal_node{1,1}: CP-ADV
move_up_node{2}: