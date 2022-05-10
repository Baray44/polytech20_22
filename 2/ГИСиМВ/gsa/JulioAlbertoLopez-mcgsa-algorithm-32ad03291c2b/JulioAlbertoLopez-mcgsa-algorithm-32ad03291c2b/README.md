# MCGSA Algorithm

## A Memetic Chaotic Gravitational Search Algorithm (M-CGSA-9) for Unconstrained Global Optimization Problems. 

This repository contains the source codes and the results obtained in the work carried out to 
write this article. 

The contents are organized as follows: 

1. **figures** --> Contains the figures of the experiments done in this work 
	1. **MCGSA vs GSA_family Synthetic_Problems.** *Contains the .png and .svg files of the convergence curves for MCGSA and GSA family in Synthetic Problems*
	2. **MCGSA vs GSA_family Real_Problems.** *Contains the .png and .svg files of the convergence curves for MCGSA and GSA family in Real-World Problems*
	3. **MCGSA vs State-of-the-art Real_Problems.** *Contains the .png and .svg files of the convergence curves for MCGSA and State-of-the-art algorithms in Real-World Problems*
2. **src**    --> Contains the source codes of the expderiments done in this work.
	1. **CEC 2011 Benchmarks.** *Directory which contains the source code to use Real-World Problems from IEEE CEC 2011 Competitions*
	2. **COBIDE.** *Directory which contains the source codes to use COBIDE algorithm (Provided by A. Piotrowski)*
	3. **GSA+QN.** *Directory which contains the source codes of GSA+QN algorithm.*
	4. **Rcr-JADE.** *Directory which contains the source codes to use Rcr-JADE algorithm (Provided by A. Piotrowski)*
	5. **RLMPSO.** *Directory which contains the source codes to use RLMPSO algorithm*													 
	6. **Synthetic Probelms.** *Directory which contains the source code to use the Synthetic benchmark problems used in this work*
	7. **Main_RealProblems_Experiment.m .** *.m file which contains the main file to excecute the experiments carried out in this work for Real-World problems*
	8. **Main_Synthetic_Problems.m .** *.m file which contains the main file to execute the experiemnts carried out in this work for Synthetic problems*
	9. **Ofcn_GA.m .** *.m Output function used in GA algorithm, which is useful when GA is executed for Synthetic or Real-World problems*
	10. **Ofcn_PSO_8.m .** *.m Output function used in GA algorithm, which is useful when PSO is executed for Real-World problem 8*
	11. **Ofcn_PSO.m .** *.m Output function used in GA algorithm, which is useful when PSO is executed for Synthetic and Real-World problems*

## INSTRUCTIONS FOR USE

In order tu run the main files for carrying out the experiments proposed in this work, the following considerations must be considered

1. For executing Synthetic Problems: The code lines commented in the following .m files related to Synthetic problems must be uncommented. 
	1. evalauteF.m
	2. ExplotationStage.m
	3. GSA.m
2. For executing Real-World Problems: The code lines commented in the following .m files related to Real-World problems muste be uncommented.
	1. evalauteF.m
	2. ExplotationStage.m
	3. GSA.m
