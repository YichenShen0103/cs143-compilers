class Main inherits A2I {

    main(): Object {
        (new IO).out_string(
            i2a(fact(a2i((new IO).in_string()))).concat("\n")
        )
    };

    fact(i: Int): Int {
        let result: Int <- 1 in {
            while (not (i = 0)) loop {
                result <- result * i;
                i <- i - 1;
            } pool;
            result;
        }
    };

};
