corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}[1]NPR*)
AND (IP-MAT idoms {2}[2]NPR*)
AND ([1]NPR* iprecedes [2]NPR*)

add_internal_node{1, 2}: NBAR