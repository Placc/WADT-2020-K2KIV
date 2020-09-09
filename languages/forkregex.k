// Forkable Regular Expressions [1]
// ================================
// Demonstrates nondeterministic choice and concurrency.
//
// An accepting configuration can be reached iff the initial
// word (epsilon by default) belongs to the language of the
// expression given as program.
//
// [1] Sulzmann M., Thiemann P. (2016) Forkable Regular Expressions.
//     In: Dediu AH., Janoušek J., Martín-Vide C., Truthe B. (eds) Language and Automata Theory and Applications.
//     LATA 2016. Lecture Notes in Computer Science, vol 9618. Springer, Cham.
//     https://doi.org/10.1007/978-3-319-30000-9_15

module FORKREGEX

  syntax Letter ::= "a" | "b" | "c"
  syntax RX ::= Letter
              | "@eps"
              | "@empty"
              | RX "*"
              > "@fork" RX
              > RX "." RX [left]
              > RX "+" RX [left]
              | "(" RX ")" [bracket]
  syntax Word ::= "@nil" | Letter "::" Word

  configuration <T>
    <threads>
      <k multiplicity="*"> $PGM:RX </k>
    </threads>
    <word> @nil </word>
    <accept> false </accept>
  </T>

  // Consume a letter
  rule <k> (X:Letter => .) ...</k> <word> (X:Letter :: W) => W </word>

  // Structural rules
  rule (R:RX . S:RX) => (R ~> S)
  rule (R:RX + _) => R
  rule (_ + R:RX) => R
  rule R* => @eps
  rule R* => (R ~> R*)

  // empty word
  rule @eps => .

  // Forking
  rule <threads>... <k> (@fork R:RX) => . ...</k> (.Bag => <k> R </k>) ...</threads>

  // no rule for empty set

  // termination (of threads and of the entire program)
  rule (<k> . </k>) => .Bag
  rule <threads> .Bag </threads> <accept> _ => true </accept>

endmodule
