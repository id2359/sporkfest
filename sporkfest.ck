fun void foo(Osc osc,int start, int drop) {
    osc => dac;
    start => int f;
    while (true) {
        f => osc.freq;
        .1::second => now;
        f - drop => f;
        if ( f < 0 ) start => f;
    }
}
    

//spork ~ foo(new SinOsc,1000,13);
spork ~ foo(new SinOsc,800,100);
spork ~ foo(new SinOsc,600,50);
spork ~ foo(new SinOsc,500,50);
spork ~ foo(new SinOsc,400,50);
spork ~ foo(new SinOsc,300,50);

while(true) 1::second => now;