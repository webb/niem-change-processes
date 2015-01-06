digraph "NTAC Activity" {
  node [shape = box, style=rounded, width=0, height=0, fontsize=10, margin=0.04, fillcolor=black];
  edge [fontsize=8, arrowhead=open];
  graph [margin=1, layout=dot, label = "A sample NTAC activity", fontsize=10];


  initial_node(start);
  fork_node(fork);
  start -> fork;

  do1 [label="NTAC member 1:\ndo thing"];
  do2 [label="NTAC member 2:\ndo thing"];
  do3 [label="NTAC member 3:\ndo thing"];
  do_etc [label="..."];
  don [label="NTAC member n:\ndo thing"];

  fork -> { do1 do2 do3 do_etc don } -> join;

  join_node(join);

  final_node(end);
  join -> end;

}
