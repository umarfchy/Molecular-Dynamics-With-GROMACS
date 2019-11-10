# Molecular Dynamics using GROMACS
Here, I will show the basic process of performing molecular dynamics using GROMACS. I will be using the all-atom OPLS force field to perform a 20 nanosecond (ns) molecular dynamics of protein named Ubiquitin (pdb id: 1UBQ).

# Setup

If you do not have GROMACS installed then type following on your command line.
```sudo apt-get install gromacs```
# Perform Molecular Dynamics
Now, do the following for you first ever simulation:-
1. Download the repository on your computer. 
2. Go inside the folder. 
3. Open the command prompt inside that folder. (Your command prompts current directory should be the same as repository's directory )
4. Type the following code on you prompt: ```bash run_main.sh```
5. Type 15 to choose 'OPLS-AA/L all-atom force field'
6. Type 13 to choose 'SOL'
7. Do NOT close the terminal and wait until the simulation is done!!!

Alternatively, you can send it work to bakground. This is specially helpful when working with servers. Do the following:-
1. Download the repository on your computer. 
2. Go inside the folder. 
3. Open the command prompt inside that folder. (Your command prompts current directory should be the same as repository's directory )
4. Type the following code on you prompt: ```bash run1.sh```. This will generate a log file named 'run_1.log'
5. Type ```tail run_1.log``` to view the log file. Repeat this once in a while until you realise that the file is no loger updating then go to the next step.
7. Now, type the following code on you prompt: ```bash run2.sh```. This will generate a log file named 'run_2.log'
8. Type ```tail run_2.log``` to view the log file. Repeat this once in a while until you realise that the file is no loger updating then go to the next step.
9.Type the following code on you prompt: ```bash run3.sh```. This will generate a log file named 'run_3.log'
10. Type ```tail run_3.log``` to view the log file. Repeat this once in a while until you realise that the file is no loger updating then go to the next step.
11.Type the following code on you prompt: ```bash run4.sh```. This will generate a log file named 'run_4.log' 
12.Type ```tail run_4.log``` to view the log file. Repeat this once in a while until you realise that the file is no loger updating then you no longer have to go to the next step!!! The simulation is complete.
13. Refer to the analysis section for performing basic analysis.

# Result

The result section contains all the results that are generated after simulation.

# Analysis

This folder contains all the basic analysis done after the simulation is performed.  
