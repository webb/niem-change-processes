digraph G {
  node [shape = box, style=rounded, width=0, height=0, fontsize=10, margin=0.04, fillcolor=black];
  edge [fontsize=8, arrowhead=open, overlap=false;];
  graph [layout=dot, fontsize=10];

  initial_node(start1);
  n6 [rep(report issue)];
  n7 [dev(review/annotate/contextualize issue)];
  assign [dev(assign issue)];
  decision_node(decide_assignment);
  start1 -> n6 -> n7 -> assign -> decide_assignment;
       
  ntac_assess [ntac(assess issue), URL="[[[ntac-assess-issue.html]]]"];
  decide_assignment:w -> ntac_assess [option([[[NTAC issue]]])];

  nbac_assess [nbac(assess issue)];
  decide_assignment -> nbac_assess [option([[[NBAC issue]]])];
  
  decision_node(ntac_decision);
  ntac_assess -> ntac_decision;

  final_node(issue_ntac_final);

  ntac_decision:w -> issue_ntac_final [option(artifact\nnot needed)];
  ntac_decision -> request [option(additional\ninfo needed)];
  refine [rep(refine/update issue)];
  refine -> n7 [weight=0];
  { rank=same; ntac_decision; request; }
  
  request [dev(request more info)];

  request -> refine;

  n1 [dev(draft/update/generate artifacts)];

  ntac_decision -> n1 [option(artifact\nneeded)];

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
