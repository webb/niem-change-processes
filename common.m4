m4_changequote([[[,]]])m4_dnl
m4_changecom(,)m4_dnl
m4_define(dev,[[[label = "lead developer:\n$1"]]])m4_dnl
m4_define(rep,[[[label = "reporter:\n$1"]]])m4_dnl
m4_define(ntac,[[[label = "NTAC:\n$1"]]])m4_dnl
m4_define(ntacm,[[[label = "NTAC members:\n$1"]]])m4_dnl
m4_define(nbac,[[[label = "NBAC:\n$1"]]])m4_dnl
m4_define(nbacm,[[[label = "NBAC members:\n$1"]]])m4_dnl
m4_define(initial_node,[[[$1 [label="", width=0.15, height=0.15, fixedsize=shape, shape=circle, style=filled, fillcolor=black]]]])m4_dnl
m4_define(final_node,[[[$1 [label="", width=0.15, height=0.15, fixedsize=shape, shape=doublecircle, style=filled, fillcolor=black]]]])m4_dnl
m4_define(fork_node,[[[$1 [label="", shape=box, style=filled, fixedsize=shape, width=1, height=0.05, fillcolor=black]]]])m4_dnl
m4_define(join_node,[[[fork_node($1)]]])m4_dnl
m4_define(decision_node_attrs,[[[shape=diamond, style=solid, margin=0]]])m4_dnl
m4_define(decision_node,[[[$1 [label="", width=0.5, height=0.25, fixedsize=shape, decision_node_attrs]]]])m4_dnl
m4_define(option,[[[label="  [$1]"]]])m4_dnl
