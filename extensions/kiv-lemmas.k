requires "kiv-arglist.k"
requires "kiv-pattern.k"

module KIV-LEMMAS
  imports KIV-ARGLIST
  imports KIV-PATTERN
  imports ID-PROGRAM-PARSING
  imports K-SORT-LATTICE
  imports AUTO-CASTS

  syntax K
  syntax String
 
  syntax K ::= "@$this(" UntypedArglist ")"                   				              [klabel(KIVLEMMA.thismany)]
             > "@$this(" K ")"                                 			                [klabel(KIVLEMMA.thisone)]
             | "@$this"                                        			                [klabel(KIVLEMMA.this)]

  syntax KivTransition  ::= KivPattern "=>" KivPattern                              [klabel(KIVLEMMA.transition)]
                          | KivPattern "=>" KivPattern "@$requires" Bool            [klabel(KIVLEMMA.transitionreq)]
                          
  syntax KivLemma       ::= "@$KivLemma(" String "):" KivTransition                 [klabel(KIVLEMMA.declaration)]

endmodule
