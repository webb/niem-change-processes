digraph G {
  node [shape = box, style=rounded, width=0, height=0, fontsize=10, margin=0.04, fillcolor=black];
  edge [fontsize=8, arrowhead=open];
  graph [layout=dot, fontsize=10, URL="index.html" ];

  subgraph cluster0 {
    shape = box; style = rounded;
    label = "NTAC: assess issue";

  initial_node(start);
  assign [dev(assign issue to NTAC)];
  fork_node(fork);
  start -> assign -> fork;
  join_node(join);

m4_define(USER,[[[m4_dnl
u$1_assess [label="NTAC member $1:\nassess issue"];
  u$1_annotate [label="NTAC member $1:\nannotate/comment/discuss issue"];
  fork -> u$1_assess -> u$1_annotate -> join[[[]]]m4_dnl
]]])m4_dnl
  USER(1);
  USER(2);
  etc1 [label="...", shape = plaintext ];
  etc2 [label="...", shape = plaintext ];
  fork -> etc1 -> etc2 -> join [style=invis];
  USER(n);

  agree [ntac(find consensus on assessment of issue), URL="other.html"];
  final_node(end);
  join -> agree -> end;
  }

}
