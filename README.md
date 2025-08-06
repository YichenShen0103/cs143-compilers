# Cool - Cool Language Compiler

### Week 1: Course Overview & The Cool Language

**Notes:**

The pipeline of the compilation process:
1. Lexical Analysis (LA) 
   - Devide program text (byte stream) into tokens

2. Parsing (P)  
   - Digram a abstract syntax tree (AST)

3. Semantic Analysis (SA)  
   - Check if there is any syntax error

4. Optimization (O)        
   - Modify the code to run faster / using less memory, modern compiler concern most about this

5. Code Generation (CG)    
   - Produce assembly code 


**PA1: Finished (Aug 3 2025)**

You will see result below.

```sh
$ cd assignments/PA1
$ make test
../../bin/coolc stack.cl atoi.cl 
stack.test
../../bin/spim -file stack.s < stack.test
SPIM Version 6.5 of January 4, 2003
Copyright 1990-2003 by James R. Larus (larus@cs.wisc.edu).
All Rights Reserved.
See the file README for a full copyright notice.
Loaded: ../lib/trap.handler
> > > > > > > s
2
+
1
> > > 3
> > > > > > > s
s
s
1
+
3
> > > > > > > 4
> Bye!
COOL program successfully executed
```

### Week 2: Lexical Analysis & Finite Automata

**Notes:**

Layers of Lexical Analysis:
1. Lexical Specification (LS)                    
    - Logical token define
2. LS to Regular Expressions (RE)                
    - Pattern matching for token at the theoretical level
3. RE to Nondeterministic Finite Automata (NFA)  
    - Pattern matching in computation theory
4. NFA to Deterministic Finite Automata (DFA)    
    - Optional trade-off, sacrifice space for faster execution 
5. 2D Table to Implement FAs                     
    - Implementation of pattern matching

**PA2: Finished (Aug 6 2025)** 

You will see grading result below.
```sh
$ cd assignments/PA2
$ perl pa2-grading.pl
Grading .....
make: Entering directory '/usr/class/assignments/PA2'
make: 'lexer' is up to date.
make: Leaving directory '/usr/class/assignments/PA2'
=====================================================================
submission: ..

=====================================================================
You got a score of 63 out of 63.

Submit code: 
63:03afdbd66e7929b125f8597834fa83a4
```

You will see demo result below.
```sh
$ ./assignments/PA2/lexer examples/hello_world.cl
#name "examples/hello_world.cl"
#1 CLASS
#1 TYPEID Main
#1 INHERITS
#1 TYPEID IO
#1 '{'
#2 OBJECTID main
#2 '('
#2 ')'
#2 ':'
#2 TYPEID SELF_TYPE
#2 '{'
#3 OBJECTID out_string
#3 '('
#3 STR_CONST "Hello, World.\n"
#3 ')'
#4 '}'
#4 ';'
#5 '}'
#5 ';'
```

---

(The compiler is still building...)