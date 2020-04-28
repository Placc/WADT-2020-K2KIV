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

5. Load the specification lemmas for a specification and start a proof
   - Double-click on "mult" or on "fac_it"
   - Select "Theorems" > "Load"
   - Double-click on "correctness" under "Unproved"
   - If you want to use our OPR Heuristics while proving, select "Control" > "Heuristics" and activate the "OPR Heuristics + Case Splitting"
   - Hint for proving: For "mult", you have to instantiate a map and a number using the rule "exists right"; afterwards, you have to apply a lemma ("numsucc")
   - Hint for proving: For "fac_it", you have to instantiate a number using the rule "exists right"
   - Select "File" > "Close proof" and update the theorem
   - Select "File" > "Close" to open the project overview


(c) 2020 Dominik Klumpp, Philip Lenzen
