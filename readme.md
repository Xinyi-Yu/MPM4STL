# MPM4STL

We propose a new monitoring approach, called **Model Predictive Monitoring**, for specifications described by Signal Temporal Logic (STL) formulae. The paper titled "Model Predictive Monitoring of Dynamic Systems for Signal Temporal Logic Specifications" got accepted to Automatica as a regular paper, and it can be found by [online link](https://www.sciencedirect.com/science/article/abs/pii/S000510982300612X) or [arxiv link](https://arxiv.org/abs/2209.12493).

We illustrate our framework by applying it to four different case studies: building temperature control (case 1), double integrator (case 2), nonholonomic mobile robot (case 3) and spacecraft rendezvous (case 4). We only open source the code for the first case, since I am too lazy to organize the remaining codes. But feel free to email me if you are interested in the implementation of case 2/3/4. 

We run the code by CPU Intel (R) Core (TM) i5-8400 CPU @ 2.80GHz. For the computation time, case 1 can be finished within 1-2 minutes while the other three cases all cost more than half a day (if you DON'T use multi-threading or multi-processing). 

#### Dependencies

In this project, we use the following packages

```
CDDLib v0.9.1
GLMakie v0.6.13
HDF5 v0.16.11
IntervalArithmetic v0.20.7
JLD v0.13.2
LaTeXStrings v1.3.0       
LazySets v2.0.0
Plots v1.31.6
Polyhedra v0.7.5
ReachabilityAnalysis v0.21.0
Symbolics v4.10.4
```

#### Acknowledgement

We would like to thank [Christian Schilling](https://github.com/schillic) and [Marcelo Forets](https://github.com/mforets) for their great help when completing our case studies and thank all the authors of packages we used. 

We also want to thank our colleagues Jianing, Xiaohua, Guangqing and Dingran for the discussion and their generous help during this work.
