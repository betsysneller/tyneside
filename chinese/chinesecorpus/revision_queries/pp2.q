corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}PP)
AND (PP idoms *W*)

replace_label{1}: WPP
