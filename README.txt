================== README ==================

To run KIV conveniently, double-click on "start.bat" (on Windows) or "start.sh" (on UNIX).

IMPORTANT: You need to have Java Version 8 installed (https://www.oracle.com/java/technologies/javase-jdk8-downloads.html)

1. Create a new Project:
   - Select "Projects" > "Create"
   - Enter a Name (we suggest "IMP")
   - Select the suggested directory ("?/IMP")
   - Enter a comment

2. Import a language definition file of a simple imperative language:
   - Select "K2KIV" > "Import K Language Definition"
   - Browse to "./languages"
   - Select "imp.k"

3. Import source code of a simple program that multiplies two variables using addition and subtraction in a loop:
   - Select "K2KIV" > "Import Source Code"
   - Select "IMP" as language specification
   - Select "## None ##" further specifications
   - Browse to "./programs"
   - Select "mult.imp"

4. Import source code of an iterative variant of factorial (which needs an additional spec containing a KIV-defined factorial definition):
   - Select "Project" > "Import"
   - Select "Factorial (normal)" as project
   - Select factorial in the tree and click "OK"
   - Select "K2KIV" > "Import Source Code"
   - Select "IMP" as language specification
   - Select "fractorial" further specifications
   - Browse to "./programs"
   - Select "fac_it.imp"

5. Import source code denoting a forkable regular expression (demonstrating concurrency)
   - Select "K2KIV" > "Import K Language Definition"
   - Browse to "./languages"
   - Select "forkregex.k"
   - Select "K2KIV" > "Import Source Code"
   - Select "FORKREGEX" as language specification
   - Select "## None ##" further specifications
   - Browse to "./programs"
   - Select "test.frx"

   This language consists of regular expressions extended by a "fork" operator (see reference in forkregex.k).
   The program consists of such an expression,
   annotated with the lemma stating that a given word (cabbcc) is in the language of the expression.

   To view the complete proof of this lemma, follow these steps:
   - On the start screen, select "Projects" > "Select".
   - Select "forkregex"
   - Double-click the "test" specification for the program.
   - Select "Theorems" > "Load"
   - Double-click the "acceptance1" theorem on the right.

6. Load the specification lemmas for a specification and start a proof
   - Double-click on "mult" or on "fac_it"
   - Select "Theorems" > "Load"
   - Double-click on "correctness" under "Unproved"
   - If you want to use our OPR Heuristics while proving, select "Control" > "Heuristics" and activate the "OPR Heuristics + Case Splitting"
   - Hint for proving: For "mult", you have to instantiate a map and a number using the rule "exists right"; afterwards, you have to apply a lemma ("numsucc")
   - Hint for proving: For "fac_it", you have to instantiate a number using the rule "exists right"
   - Hint for proving: For "test.frx", most proof steps are manual due to nondeterminism and concurrency.
     Use (Transitivity) to make a step, and then (One Step) in the left premise to justify it. Continue in the right premise.
     Unroll the outer loop twice, first choosing the 2nd branch and in the second iteration the 1st branch.
   - Select "File" > "Close proof" and update the theorem
   - Select "File" > "Close" to open the project overview


(c) 2020 Dominik Klumpp, Philip Lenzen
