requires "kiv-pattern.k"

module KIV-INSTRUCTIONS
  imports KIV-PATTERN

  syntax KivInstruction ::= "@$KivInvariant:" KivPattern "(" K ")" [klabel(KIVINST.invariant)]
                          | "@$KivAssertion:" KivPattern "(" K ")" [klabel(KIVINST.assertion)]
                          | "@$KivUnwind(" K ")"                   [klabel(KIVINST.unwind)]

endmodule