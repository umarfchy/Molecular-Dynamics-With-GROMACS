gmx pdb2gmx -f protein.pdb -o protein_processed.gro -water tip3p

gmx editconf -f protein_processed.gro -o protein_newbox.gro -c -d  1.0 -bt cubic

gmx solvate  -cp protein_newbox.gro  -cs spc216.gro  -o protein_solv.gro -p topol.top 

gmx grompp  -f ions.mdp  -c protein_solv.gro  -p topol.top  -o ions.tpr 

gmx genion -s ions.tpr -o protein_solv_ions.gro -pname NA -nname CL -conc 0.1 -neutral -p topol.top

gmx grompp -f minim.mdp  -c protein_solv_ions.gro  -p topol.top  -o em.tpr

gmx mdrun -v -deffnm em 

gmx grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr

gmx mdrun -v -deffnm nvt

gmx grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr

gmx mdrun -v -deffnm npt 

gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o md_20ns.tpr

gmx mdrun -v -deffnm md_20ns
