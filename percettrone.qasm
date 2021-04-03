// Name of Experiment: Percettrone v27

OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
qreg a[1];
creg c[1];

//->->->->->->->->->-
// Inizializzazione
h q;
barrier q;
//->->->->->->->->->-
// Ui

// 0001
//x q;
//h q[1]; cx q[0],q[1]; h q[1];
//x q;

// 0010
x q[1];
h q[1]; cx q[0],q[1]; h q[1];
x q[1];

// 0100
x q[0];
h q[1]; cx q[0],q[1]; h q[1];
x q[0];

// 1000
h q[1]; cx q[0],q[1]; h q[1];

// Uw
// chiusura
barrier q;
h q;
x q;

// Toffoli gate

h a;
cx q[1],a;
tdg a;
cx q[0],a;
t a;
cx q[1],a;
tdg a;
cx q[0],a;
t q[1]; t a;
h a;
cx q[0],q[1];
t q[0]; tdg q[1];
cx q[0],q[1];

measure a -> c;