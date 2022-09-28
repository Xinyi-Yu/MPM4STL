# MPM4STL

We propose a new monitoring approach, called **Model Predictive Monitoring**, for specifications described by Signal Temporal Logic (STL) formulae. The paper titled "Model Predictive Monitoring of Dynamic Systems for Signal Temporal Logic Specifications" can be found in [link](https://arxiv.org/abs/2209.12493).

We illustrate our framework by applying it to four different case studies: building temperature control (case 1), double integrator (case 2), nonholonomic mobile robot (case 3) and spacecraft rendezvous (case 4), where offline computation process codes can be found in this repository. 

#### Offline computation time

We run the code by CPU Intel (R) Core (TM) i5-8400 CPU @ 2.80GHz. For the computation time, case 1 can be finished with1-2 minutes while the other three cases all cost more than half a day. In the last three cases, if you want to obtain the results by yourself, I only recommend you to run for several time steps in function `comp()` from `compute_details.jl`, since the complete computation is very time-consuming. 

#### Offline computation results

We export all the feasible and satisfiable sets data to file `results.jld` in the last three cases. Please feel free to contact me by email yuxinyi-12@sjtu.edu.cn if your want to get them.

We also plot the feasible and satisfiable sets results in the form of figure (case 1) and animation (case 2, 3 and 4), which can be found in the folder `offline results` [link](https://github.com/Xinyi-Yu/MPM4STL/tree/main/offline%20results). Note that in last three cases, the offline results shown in the animation is the projection to 2 dimensions and you can also plot them in other dimensions by your own. 

(Currently, the codes and animations of last three cases still needs some refinement and I will publish them as soon as possible.)

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
