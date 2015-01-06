digraph Processes {
  node [shape = box, style=rounded, width=0, height=0, fontsize=10, margin=0.04, fillcolor=black];
  edge [fontsize=8, arrowhead=open];
  graph [margin=1, layout=dot, fontsize=10];

  initial_node(start1);
  n6 [rep(report issue)];
  refine [rep(refine/update issue)];
  n7 [dev(review/annotate/contextualize issue)];
  fork_node(fork1);

  start1 -> n6 -> n7 -> fork1;
  refine -> n7;
       

  n9 [ntac(assess technical aspects)];
  n16 [ntacm(update issues/comment)];
  issue_ntac_go [decision_node_attrs, ntac(artifact needed?)];
  final_node(issue_ntac_final);

  fork1 -> n9 -> n16 -> issue_ntac_go;
  issue_ntac_go -> issue_ntac_final [option(no)];

  n8 [nbac(assess business aspects)];
  n17 [nbacm(update issues/comment)];
  issue_nbac_go [decision_node_attrs, nbac(artifact needed?)];
  final_node(issue_nbac_final);

  fork1 -> n8 -> n17 -> issue_nbac_go;
  issue_nbac_go -> issue_nbac_final [option(no)];

  join_node(join1);


  { issue_ntac_go issue_nbac_go } -> join1 [option(yes)];

  n1 [dev(draft/update/generate artifacts)];

  join1 -> n1;

  n10 [dev(brief to NTAC)];
  n2 [dev(integrate changes)];
  n3 [dev(respond to issues)];
  n4 [ntacm(review artifacts)];
  n5 [ntacm(enter/update issues[[[,]]]\ndraft text[[[,]]]\ntest rules)];
  n11 [ntac(publish artifacts?), decision_node_attrs];
  n15 [ntac(determine version ID)];
  final_node(end1);
  n12 [dev(publish artifacts to reference.niem.gov)];
  n13 [ntac(done?); decision_node_attrs];

  n1 -> n10 -> n11;
  n11 -> n15 [option(yes)];
  n15 -> n12 -> n13;
  n13 -> n4 [option(no)];
  n13 -> end1 [option(yes)];
  n11 -> n4 [option(no), weight = 0];
  n4 -> n5 -> n2 -> n3;
  n3 -> n1 [weight = 0];
}
