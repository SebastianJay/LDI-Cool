class Dictionary {
 head: DicNode;
 get(n:String): DicNode {
    {
      if isvoid head then
        (new DicNode).init(n, 0)
      else
        head.get(n)
      fi;
    }
  };
  insert(n:String): DicNode {
    if isvoid head then
       head <- (new DicNode).init(n,0)
    else head.insert(n)
    fi
  };
 getHead():DicNode {
    head
  };

 setHead(h: DicNode):DicNode {
    head <- h
  };
};

class DicNode {
 name : String;
 count : Int;
 next : DicNode;
  
 init(n:String, c:Int): DicNode {
    {
      name <- n;
      count <- c;
      self;
    }
  };
 get(n:String): DicNode {
    {
      if n = name then
        self
      else
          if isvoid next then
            (new DicNode).init(n,0)
          else 
            next.get(n)
          fi          
      fi;
    }
  };

  insert(n: String):DicNode {
     {
        if n = name then
           self
        else if isvoid next then
             next <- (new DicNode).init(n,0)
         else next.insert(n)
         fi
        fi;
     }
   };
 name() : String {
    name
  };
 getCount() : Int {
    count
  };
 incr() : DicNode {
    {
      count <- count + 1;
      self;
    }
  };

 decr() :DicNode {
    {
      count <- count - 1;
      self;
    }
  };

 next() : DicNode {
    next
  };
  setNext(n:DicNode) : DicNode {
    {
        next <- n;
        self;
    }
  };
};


class List {
 head: ListNode;
 getHead() : ListNode {
    head
  };
 insert(s:String) : ListNode {
    if isvoid head then
       head <- (new ListNode).init(s)
      else head.insert(s)
    fi
  };
};

class ListNode {
 val : String;
 next : ListNode;
 init(s:String) : ListNode {
    {
      val <- s;
      self;
    }
  };

 get() : String {
    val
  };
 next() : ListNode {
    next
  };
 insert(s:String) : ListNode {
    if isvoid next then
     next <- (new ListNode).init(s)
      else next.insert(s)
    fi
  };

};
 




class Main inherits IO {
 main() : Main {
      let reqCount : Dictionary <- new Dictionary,
        tasks : List <- new List in {
        let done : Bool <- false in 
        while not done loop 
          let s : String <- in_string() in 
          if s = "" then
            done <- true
            else tasks.insert(s)
          fi
          
        pool;
        let x : ListNode <- tasks.getHead() in 
          while not isvoid x loop {
              reqCount.insert(x.get()).incr();
              x <- x.next();

              reqCount.insert(x.get());
              x <- x.next();             
            } pool;
        let taskOrder : List <- new List, cycle : Bool <- false in {
          let minT : String, minC : Int, minFound : Bool <- false, done:Bool <- false,  i : DicNode, j : ListNode
            in {
            while not done loop {
            minFound <- false;
            i  <- reqCount.getHead();
            while not isvoid i loop {
                if not i.getCount() < 0 then
                   if not minFound then {
                      minC <- i.getCount();
                      minT <- i.name();
                       minFound <- true;
                   }
                   else
                     if i.getCount() < minC then {
                        minC <- i.getCount();
                        minT <- i.name();
                     }
                     else
                        if i.getCount() = minC then
                           if i.name() < minT then {
                              minC <- i.getCount();
                              minT <- i.name();
                           }
                           else minC <- minC 
                           fi
                        else minC <- minC 
                        fi
                    fi
                  fi
                else
                self
                fi;
                i <- i.next();
              } pool;
            if not minC = 0 then 
                     cycle <- true
              else cycle <- cycle fi;
            taskOrder.insert(minT);
            
            
            reqCount.get(minT).decr().decr();
            j <- tasks.getHead();
            while not isvoid j loop {
                  if j.next().get() = minT then
                     reqCount.get(j.get()).decr()
                  else
                     self
                  fi;
                  j <- j.next().next();
                  
            } pool;

            done <- true;
            i <- reqCount.getHead();
            while not isvoid i loop {
                  if not i.getCount() < 0 then
                     done <- false
                  else self fi;
                  i <- i.next();
            } pool;
		
	   } pool;
	  };
          if cycle then
            out_string("cycle\n")
           else
          let i : ListNode <- taskOrder.getHead() in
          while not isvoid i loop {
                out_string(i.get().concat("\n"));
                i <- i.next();
          } pool 
          fi;
                   
	};
	
      self;
    }  
  };
};
