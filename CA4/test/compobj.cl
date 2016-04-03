class Main inherits IO {
    main() : Object {
        let f : SELF_TYPE <- self, g : SELF_TYPE <- self in
        if f = g then
            if f < g then
                if f <= g then
                    out_int(0)
                else
                    out_int(1)
                fi
            else
                if f <= g then
                    out_int(2)
                else
                    out_int(3)
                fi
            fi
        else
            if f < g then
                if f <= g then
                    out_int(4)
                else
                    out_int(5)
                fi
            else
                if f <= g then
                    out_int(6)
                else
                    out_int(7)
                fi
            fi
        fi
    };
};
