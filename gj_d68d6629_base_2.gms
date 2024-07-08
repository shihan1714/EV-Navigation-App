$gdxIn gj_d68d6629_base_2_gdxin.gdx
$onMultiR
$if not declared nodes set nodes(*) 'nodes';
$load nodes
$if not declared distances parameter distances(nodes,nodes) '';
$load distances
$gdxIn
$offeolcom
$eolcom #
alias(i, j, nodes)
parameter supply(nodes) /29041 1, 17191 -1/;

set arcs(nodes, nodes);
arcs(i,j) = distances(i,j) > 0;
* Variables for the optimization problem
* Variable for total distance
variables totalDistance;
* Flow variables for each arc      
positive variables x(nodes,nodes) flow; 

* Equations for constraints and objective
equations balance(nodes), objective;

* Balance equation for flow conservation
balance(nodes)..
    sum(arcs(nodes,j), x(nodes,j)) - sum(arcs(i,nodes), x(i,nodes)) =e= supply(nodes);

* Objective function for total distance minimization
objective..
    totalDistance =e= sum(arcs, distances(arcs) * x(arcs));

* Model definition and solving
model short1 / balance, objective /;
solve short1 minimizing totalDistance using lp;

option x:5:0:2;
display x.l, totalDistance.l, distances;
display arcs;

* Define a set to hold the used arcs
set usedArcs(nodes, nodes);

* Populate the set with arcs that have positive flow in the solution
usedArcs(i,j)$(x.l(i,j) > 0) = yes;

* Display the used arcs
display usedArcs;
