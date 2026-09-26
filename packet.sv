class packet;           
    bit start;

   rand bit [7:0] A;
   rand bit [7:0] B;
                     
   bit [7:0] gcd;
   bit       busy;
   bit       done;

   constraint valid {A != 0; B != 0;}
   endclass
