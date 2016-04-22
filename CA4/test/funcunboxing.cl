class Main inherits IO {
    main() : Object {
        let x : Int <- 5, y : Bool <- false in {
            funccase(x);
            funccase(y);
            funccase(5);
            funccase(false);
            funccase(new Object);
            funccasei(x);
            funccasei(5);
            funcifi(x);
            funcifi(5);
            funcifb(y);
            funcifb(false);
            funcwhilei(x);
            funcwhilei(5);
            funcwhileb(y);
            funcwhileb(false);
        }
    };
    funccase(o:Object) : Object {
        case o of x:Int => out_int(x);
            b:Bool => if b then out_int(1) else out_int(0) fi;
            o:Object => out_string(o.type_name());
        esac
    };
    funccasei(i:Int) : Object {
        case i of x:Int => out_int(x);
            b:Bool => if b then out_int(1) else out_int(0) fi;
        esac
    };
    funccaseb(i:Bool) : Object {
        case i of x:Int => out_int(x);
            b:Bool => if b then out_int(1) else out_int(0) fi;
        esac
    };
    funcifi(i:Int): Object {
        if i <= 5 then out_int(1) else out_int(0) fi
    };
    funcifb(i:Bool): Object {
        if i then out_int(1) else out_int(0) fi
    };
    funcwhilei(i:Int):Object {{
        while i < 5 loop out_int(i<-i+1) pool;
        out_int(i);
    }};
    funcwhileb(i:Bool):Object {{
        while not i loop funcifb(i<-not i) pool;
        funcifb(i);
    }};
};
