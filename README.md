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

### Week 3 & 4: Parsing (Intro, Top-down, Bottom-up)

**Notes:**

Top-down parsing (LL1 Parsing)
1. Build a parsing table T (First sets and Follow sets).
2. Initialize the parsing stack = <S, $>
3. If the stack top is a non-terminal X, pop X, push T[X, *next]; else terminal t and *next == t, pop t, next++.
4. Report an error if t != *next or T[X, *next] is invalid.
5. If the stack is empty, accept; else turn back to (2).

Bottom-up parsing (SLR Parsing)
1. Build a action table and goto table.
2. Initialize a stack containing the state and current symbol, the whole stack is a valid perfix.
3. Look up action[stack.top().second, input[j]], if shift k push <input[j++], k>; if reduce X -> a: pop all pairs in a, push <X, goto[stack.top().second, X]>; if accept halt normally; if error halt and report error.

**PA3: Finished (Aug 12 2025)**

You will see grading result below.

```sh
$ cd assignments/PA3
$ perl pa3-grading.pl
Grading .....
make: Entering directory '/usr/class/assignments/PA3'
make: 'parser' is up to date.
make: Leaving directory '/usr/class/assignments/PA3'
=====================================================================
submission: ..

=====================================================================
You got a score of 70 out of 70.

Submit code: 
70:7cbbc409ec990f19c78c75bd1e06f215
```

You will see demo result below.
```sh
$ cd assignments/PA3
$ ./myparser ../../examples/hello_world.cl
#1
_program
  #1
  _class
    Main
    IO
    "../../examples/hello_world.cl"
    (
    #2
    _method
      main
      SELF_TYPE
      #3
      _dispatch
        #3
        _object
          self
        : _no_type
        out_string
        (
        #3
        _string
          "Hello, World.\n"
        : _no_type
        )
      : _no_type
    )
```

---

(The compiler is still building...)