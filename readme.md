# MPM4STL

We propose a new monitoring approach, called **model predictive monitoring**, for specifications described by Signal Temporal Logic (STL) formulae. The paper titled "Model Predictive Monitoring of Dynamic Systems for Signal Temporal Logic Specifications" can be found in [link].

We illustrate our our framework by applying it to four different case studies: building temperature control (case 1), double integrator (case 2), nonholonomic mobile robot (case 3) and spacecraft rendezvous (case 4), where offline computation process codes can be found in this repository. 

#### Offline computation time and results

We run the code by CPU Intel (R) Core (TM) i5-8400 CPU @ 2.80GHz. For the computation time, case 1 can be finished with1-2 minutes while the other three cases all cost more than half a day. In the last three cases, if you want to obtain the results by yourself, I only recommend you to run for several time steps in function `comp()` from `compute_details.jl`, since the complete computation is very time-consuming. 

We also export all the feasible and satisfiable sets data to file `results.jld` in the last three cases. Please feel free to contact me by email yuxinyi-12@sjtu.edu.cn if your want to get them.

Furthermore. we also plot the feasible and satisfiable sets results by the animation which can be found by [link](https://github.com/Xinyi-Yu/MPM4STL/blob/main/Offline%20computation%20results.md). 

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

We would like to thank [Christian Schilling](https://github.com/schillic) and [Marcelo Forets](https://github.com/mforets) for their great help when completing our case studies. 

We also want to thank our colleagues Jianing, Xiaohua, Guangqing and Dingran for the discussion and their generous help during this work.
