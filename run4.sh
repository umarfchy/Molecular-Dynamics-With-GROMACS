gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o md_20ns.tpr

gmx mdrun -v -deffnm md_20ns &> run_4.log &
