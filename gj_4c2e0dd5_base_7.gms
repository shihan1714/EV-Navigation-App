$gdxIn gj_4c2e0dd5_base_7_gdxin.gdx
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

* Model definition
model short1 / balance, objective /;

* Packaging to send to NEOs via kestrel solver
short1.optfile=1;
option lp=kestrel;
solve short1 minimizing totalDistance using lp;
$echo email shih.andrew@outlook.com > kestrel.opt
$echo kestrel_solver minos >> kestrel.opt

option x:5:0:2;
display x.l, totalDistance.l, distances;
display arcs;

* Define a set to hold the used arcs
set usedArcs(nodes, nodes);

* Populate the set with arcs that have positive flow in the solution
usedArcs(i,j)$(x.l(i,j) > 0) = yes;

* Display the used arcs
display usedArcs;
