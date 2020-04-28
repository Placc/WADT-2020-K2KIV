module EXAMPLE
	
	syntax Stmt ::= Id "=" Int 
				| "while" "(" Id ")" "{" Stmt "}"
				| Id "*=" Id
				> Id "--"
				> Stmt Stmt [left]


	configuration <T> 
					<k> $PGM:Stmt </k> 
					<state> .Map </state> 
				  </T>

	rule S1:Stmt S2:Stmt => S1 ~> S2 [structural]

	rule <k> X:Id *= Y:Id => . ...</k> <state>... Y |-> J X |-> (I => I *Int J) ...</state>
	rule <k> X:Id -- => . ...</k> <state>... X |-> (I => I -Int 1) ...</state>

	rule <k> while ( X ) { S } => S while ( X ) { S } ...</k> <state>... X |-> I:Int ...</state> requires 0 =/=Int I
	rule <k> while ( X ) { S } => . ...</k> <state>... X |-> 0 ...</state>

	rule <k> X:Id = I:Int => . ...</k> <state> M:Map (.Map => X |-> I) </state> requires notBool (X in keys(M))

endmodule