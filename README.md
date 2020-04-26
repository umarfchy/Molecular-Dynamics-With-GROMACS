# Molecular Dynamics using GROMACS
This tutorial shows the basic process of performing molecular dynamics using GROMACS. The all-atom OPLS force field was to perform a 20 nanosecond (ns) molecular dynamics of protein named Ubiquitin (pdb id: 1UBQ). It is by no means a comprehensive tutorial. Its just a quick way of performing the simulation to make life a little bit easier!!!

# Setup

If you do not have GROMACS installed then type the following on your linux command line.
```sudo apt-get install gromacs```

# Perform Molecular Dynamics
Now, take the following steps to perform your first ever molecular dynamics simulation!!! 

1. Download/clone this repository on your computer. 
2. Go inside the folder. 
3. Open the command line inside that folder. (Your command line's current directory should be the same as repository's directory )
4. Type the following code on you prompt: ```bash run_main.sh```
5. Type 15 to choose 'OPLS-AA/L all-atom force field'
6. Type 13 to choose 'SOL'
7. Do NOT close the terminal and wait until the simulation is done. That's it!!!

Alternatively, you can send the work to bakground. This is specially helpful when working with servers. Do the following:-
1. Download the repository on your computer. 
2. Go inside the folder. 
3. Open the command line inside that folder. (Your command line's current directory should be the same as repository's directory )
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

You can download the result [here](https://drive.google.com/file/d/16YBVtBMm6LMhNpkXPDAqYWni0rGpMQeQ/view?usp=sharing).

# Analysis

The analysis folder contains all the basic analysis files that are performed after the simulation is done. 

In order to obtain the tragectory file perform the following on the same location where the simulation file exists.

``` gmx trjconv -s md_20ns.tpr -f md_20ns.xtc -o md_20ns_noPBC.xtc -pbc mol -center -ur compact``` 

Select 1 for centering 'protein' and select 0 for 'system' consecutively. 

# Root mean square fluctuation

``` gmx rms -s md_20ns.tpr -f md_20ns_noPBC.xtc -o rmsd.xvg -tu ns``` 

Select 'Backbone' both the times.

# Radius of Gyration
``` gmx gyrate -s md_20ns.tpr -f md_20ns_noPBC.xtc -o gyrate.xvg``` 

Select 'Backbone'.

# Root mean square fluctuation
``` gmx rmsf -s md_20ns.tpr -f md_20ns_noPBC.xtc -o rmsf_with_res.xvg -res``` 
Select 'Backbone'.

# Compute and analyse hydrogen bond
For intra-protein run the following code and select 'Protein' twice. 
```gmx hbond -f md_20ns_noPBC.xtc -s md_20ns.tpr -num hydrogen2-bond-intra-protein.xvg```

For intra-protein run the following code and select 'Protein' and 'Water'. 
```gmx hbond -f md_20ns_noPBC.xtc -s md_20ns.tpr -num hydrogen2-bond-protein-water.xvg```

For intra-protein run the following code and select 'Protein' and 'Ligand'. 
```gmx hbond -f md_20ns_noPBC.xtc -s md_20ns.tpr -num hydrogen2-bond-protein-ligand.xvg```


# Compute solvent accessible surface area
```gmx sasa -f md_20ns_noPBC.xtc -s md_20ns.tpr -o sas2.xvg -oa atomic2-sas.xvg -or residue2-sas.xvg```

# Principle Component Analysis (PCA)
```gmx covar -f md_20ns_noPBC.xtc -s md_20ns.tpr -o eigenval.xvg  -v eigenvec.trr -av average.pdb -xpm covar.xpm -xpma covara.xpm```


# Gromacs pdb files

In order to visulize the simulation use any of the following codes with the corresponding choice of time frame. You can select 'System' if you want to visualize the entire system or else you can choose 'Protein' to only see the changes in the protein. 

For 1 frame per nano second:
``` gmx trjconv -s md_20ns.tpr -f md_20ns_noPBC.xtc -dt 1000 -o ts_pernano_1frame.pdb``` 

For 4 frames per nano second:
``` gmx trjconv -s md_20ns.tpr -f md_20ns_noPBC.xtc -dt 250 -o ts_pernano_4frames.pdb``` 

For 10 frames per nano second:
```gmx trjconv -s md_20ns.tpr -f md_20ns_noPBC.xtc -dt 100 -o ts_pernano_10frames.pdb``` 

N.B. The md.mdp file can be modified to change the time of simulation and the simulation conditon (e.g. Temperature)


Credits: The tutorial was made following the tutorial of [Lysozyme in Water](http://www.mdtutorials.com/gmx/lysozyme/index.html) made by Justin A. Lemkul, Ph.D. Please visit the website for more details.
