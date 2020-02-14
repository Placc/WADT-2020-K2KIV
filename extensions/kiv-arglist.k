module KIV-ARGLIST
  imports K-TOP-SORT

  syntax K
  syntax String

  syntax UntypedArglist ::= K "," K                                        		    [klabel(KIVFUNC.arg)]
                          | K "," UntypedArglist                   				    [klabel(KIVFUNC.arglist)]

  syntax TypedArglist ::= K ":" String "," K ":" String                    		    [klabel(KIVFUNC.typedarg)]
                        | K ":" String "," TypedArglist                			    [klabel(KIVFUNC.typedarglist)]		
endmodule