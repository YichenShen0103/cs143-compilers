(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class Node {
   data : String;
   next : Node;

   init(e : String, n : Node) : Node {
      {
         data <- e;
         next <- n;
         self;
      }
   };

   getData() : String {
      data
   };

   getNext() : Node {
      next
   };

   setData(e : String) : Node {
      {
         data <- e;
         self;
      }
   };

   setNext(node : Node) : Node {
      {
         next <- node;
         self;
      }
   };
};

class Stack inherits A2I {
   head: Node;
   length: Int;

   init() : Stack {
      let nil: Node 
      in {
         head <- (new Node).init("", nil);
         length <- 0;
         self;
      }
   };

   push(elem : String) : Stack {
      let nil: Node,
          node : Node <- (new Node).init(elem, nil)
      in {
         node.setNext(head.getNext());
         head.setNext(node);
         length <- length + 1;
         self;
      }
   };

   pop() : Stack {
      if (length = 0)
         then self
      else {
         let nextNode : Node <- head.getNext() in head.setNext(nextNode.getNext());
         length <- length - 1;
         self;
      }
      fi
   };

   top() : String {
      if (length = 0) then "NONE" 
      else 
         head.getNext().getData()
      fi
   };

   size() : Int {
      length
   };

   display() : String {
      let result : String <- "",
          node : Node <- head.getNext()
      in {
         while (not (isvoid node)) loop {
            result <- result.concat(node.getData());
            result <- result.concat("\n");
            node <- node.getNext();
         } pool;

         result;
      }
   };

   evaluate() : Stack {
      if (length = 0) then self
      else {
         let top : String <- head.getNext().getData(),
             tmp1 : String,
             tmp2 : String
         in {
            if (top = "s") then {
               pop();
               if (length < 2) then self
               else {
                  tmp1 <- top();
                  pop();
                  tmp2 <- top();
                  pop();
                  push(tmp1);
                  push(tmp2);
               } fi;
            } else if (top = "+") then {
               pop();
               if (length < 2) then self
               else {
                  tmp1 <- top();
                  pop();
                  tmp2 <- top();
                  pop();
                  if (not (isDigit(tmp1))) then { push(tmp2); push(tmp1); }
                  else if (not (isDigit(tmp2))) then { push(tmp2); push(tmp1); }
                  else { push(i2a(a2i(tmp1) + a2i(tmp2))); } fi fi;
               } fi;
            } else { self; } fi fi;
            self;
         };
      } fi
   };

   isDigit(i : String) : Bool {
      if (i.substr(0,1) = "0") then true else
      if (i.substr(0,1) = "1") then true else
      if (i.substr(0,1) = "2") then true else
      if (i.substr(0,1) = "3") then true else
      if (i.substr(0,1) = "4") then true else
      if (i.substr(0,1) = "5") then true else
      if (i.substr(0,1) = "6") then true else
      if (i.substr(0,1) = "7") then true else
      if (i.substr(0,1) = "8") then true else
      if (i.substr(0,1) = "9") then true else false
      fi fi fi fi fi fi fi fi fi fi
   };
};

class Main inherits IO {

   main() : Object {
      let stop : Bool <- false,
          input : String,
          stack : Stack <- (new Stack).init()
      in {
         while (not stop) loop {
            out_string("> ");
            input <- in_string();

            if (input = "x") then { stop <- true; }
               else if (input = "+") then { stack <- stack.push(input); }
                  else if (input = "s") then { stack <- stack.push(input); }
                     else if (input = "e") then { stack <- stack.evaluate(); }
                        else if (input = "d") then { out_string(stack.display()); }
                           else if (stack.isDigit(input)) then { stack <- stack.push(input); }
                              else { out_string("Invalid input, please try again!\n"); }
                           fi
                        fi
                     fi
                  fi
               fi
            fi;
         } pool;
         
         out_string("Bye!\n");
         0;
      }
   };

};
