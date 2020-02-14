module KIV-PATTERN
  imports K-SORT-LATTICE
  imports AUTO-CASTS

  syntax K
  syntax String

  syntax KivExprBubble  ::= r"´[^´]*´"													                    [token]
 
  syntax KivPattern ::= Bool
  					 	        |"@$initialConfig(" K ")"								                      [klabel(KIVPAT.initialconfig)]
  				 		        | "@$not(" KivPattern ")"                    			            [klabel(KIVPAT.not)]
                      | KivPattern "@$or" KivPattern                         			  [klabel(KIVPAT.or)]
                      | KivPattern "@$and" KivPattern                        			  [klabel(KIVPAT.and)]
                      | KivPattern "@$imp" KivPattern                       			  [klabel(KIVPAT.imp)]
                      | KivPattern "@$equ" KivPattern                       			  [klabel(KIVPAT.equ)]
                      | "@$all(" K "." KivPattern ")"                               [klabel(KIVPAT.all)]
                      | "@$exists(" K "." KivPattern ")"                            [klabel(KIVPAT.exists)]
                      | "(" KivPattern ")"                                          [bracket]  
                      | KivExprBubble	 											                        [klabel(KIVPAT.expression)]

endmodule
