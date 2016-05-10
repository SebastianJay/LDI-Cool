class Matrix {
    a11 : Int;
    a12 : Int;
    a13 : Int;
    a14 : Int;
    a15 : Int;

    a21 : Int;
    a22 : Int;
    a23 : Int;
    a24 : Int;
    a25 : Int;

    a31 : Int;
    a32 : Int;
    a33 : Int;
    a34 : Int;
    a35 : Int;

    a41 : Int;
    a42 : Int;
    a43 : Int;
    a44 : Int;
    a45 : Int;

    a51 : Int;
    a52 : Int;
    a53 : Int;
    a54 : Int;
    a55 : Int;

    get(i : Int, j: Int) : Int {
        if i = 1
        then
            if j = 1 then a11
            else if j = 2 then a12
            else if j = 3 then a13
            else if j = 4 then a14
            else if j = 5 then a15
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else if i = 2
        then
            if j = 1 then a21
            else if j = 2 then a22
            else if j = 3 then a23
            else if j = 4 then a24
            else if j = 5 then a25
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else if i = 3
        then
            if j = 1 then a31
            else if j = 2 then a32
            else if j = 3 then a33
            else if j = 4 then a34
            else if j = 5 then a35
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else if i = 4
        then
            if j = 1 then a41
            else if j = 2 then a42
            else if j = 3 then a43
            else if j = 4 then a44
            else if j = 5 then a45
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else if i = 5
        then
            if j = 1 then a51
            else if j = 2 then a52
            else if j = 3 then a53
            else if j = 4 then a54
            else if j = 5 then a55
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else 1/0
        fi fi fi fi fi
    };
    set(i : Int, j: Int, x : Int) : Int {
        if i = 1
        then
            if j = 1 then a11 <- x
            else if j = 2 then a12 <- x
            else if j = 3 then a13 <- x
            else if j = 4 then a14 <- x
            else if j = 5 then a15 <- x
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else if i = 2
        then
            if j = 1 then a21 <- x
            else if j = 2 then a22 <- x
            else if j = 3 then a23 <- x
            else if j = 4 then a24 <- x
            else if j = 5 then a25 <- x
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else if i = 3
        then
            if j = 1 then a31 <- x
            else if j = 2 then a32 <- x
            else if j = 3 then a33 <- x
            else if j = 4 then a34 <- x
            else if j = 5 then a35 <- x
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else if i = 4
        then
            if j = 1 then a41 <- x
            else if j = 2 then a42 <- x
            else if j = 3 then a43 <- x
            else if j = 4 then a44 <- x
            else if j = 5 then a45 <- x
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else if i = 5
        then
            if j = 1 then a51 <- x
            else if j = 2 then a52 <- x
            else if j = 3 then a53 <- x
            else if j = 4 then a54 <- x
            else if j = 5 then a55 <- x
            else 1/0 -- Index out of bounds, throw some kind of error
            fi fi fi fi fi
        else 1/0
        fi fi fi fi fi
    };
    elMul(m:Matrix, i : Int, j:Int) : Int {
        let k : Int <- 1, sum : Int <- 0 in {
            while k <= 5 loop {
                sum <- sum + (self.get(i,k) * m.get(k,j));
                k <- k + 1;
            } pool;
            sum;
        }
    };
    mul(m : Matrix) : Matrix {
        let res : Matrix <- new Matrix, i : Int <- 1, j: Int <- 1 in {
            while i <=5 loop {
                j <- 1;
                while j <= 5 loop {
                    res.set(i,j, self.elMul(m, i,j));
                    j <- j + 1;
                } pool;
                i <- i + 1;
            } pool;
            res;
        }
    };
};

class Main inherits IO {
    main() : Object {
        let x : Int <- 100 in
        while 0 <= x loop {
        let m1 : Matrix <- new Matrix, m2 : Matrix <- new Matrix, i : Int <- 1, j : Int <- 1 in {
           while i <= 5 loop {
                j <- 1;
                while j <= 5 loop {
                    m1.set(i,j, i*j);
                    m2.set(i,j, i+j);
                    j <- j+1;
                } pool;
                i <- i+1;
            } pool;
            m1 <- m1.mul(m2);
           i<-1; 
           while i <= 5 loop {
                j <- 1;
                while j <= 5 loop {
                    out_int(m1.get(i,j));
                    out_string("\t");
                    j <- j+1;
                } pool;
                out_string("\n");
                i <- i+1;
            } pool;
        };
        x <- x-1;
        } pool
    };
};

