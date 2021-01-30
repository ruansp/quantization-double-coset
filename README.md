# Quantizing Euclidean motions via double-coset decomposition
Matlab implementation for quantizing Euclideam motions using double-coset decomposition

## Authors:
+ Christian Wülker: Philips Research Hamburg
+ Ruan Sipu (repository maintainer): National University of Singapore, ruansp@nus.edu.sg
+ Greogory S. Chirikjian: National University of Singapore, mpegre@nus.edu.sg

# Introduction
Concepts from mathematical crystallography and group theory are used here to quantize the group of rigid-body motions, resulting in a "motion alphabet" with which to express robot motion primitives. From these primitives it is possible to develop a dictionary of physical actions. Equipped with an alphabet of the sort developed here, intelligent actions of robots in the world can be approximated with finite sequences of characters, thereby forming the foundation of a language in which to articulate robot motion. In particular, we use the discrete handedness-preserving symmetries of macromolecular crystals (known in mathematical crystallography as Sohncke space groups) to form a coarse discretization of the space SE(3) of rigid-body motions. This discretization is made finer by subdividing using the concept of double-coset decomposition. More specifically, a very efficient, equi-volumetric quantization of spatial motion can be defined using the group-theoretic concept of a double-coset decomposition of the form Γ\SE(3)/Δ, where Γ is a Sohncke space group and Δ is a finite group of rotational symmetries such as those of the icosahedron. The resulting discrete alphabet is based on a very uniform sampling of SE(3) and is a tool for describing the continuous trajectories of robots and humans. An efficient coarse-to-fine search algorithm is presented to round off any motion sampled from the continuous group of motions to the nearest element of our alphabet. It is shown that our alphabet and this efficient rounding algorithm can be used as a geometric data structure to accelerate the performance of other sampling schemes designed for desirable dispersion or discrepancy properties. Moreover, the general "signals to symbols" problem in artificial intelligence is cast in this framework for robots moving continuously in the world.

# Test Scripts
+ `alphaber_conceptual_plot.m` Conceptual plot for alphabet and round-off for continuous Euclidean motions, __reproduction of Figure 4__
+ `decomp_SE2_p1.m`, `decomp_SE2_p4.m` Single coset decomposition of SE(2) by p1, p4 symmetry groups, __reproduction of Figure 7__
+ `motion_example.m` Example of discretization of SE(2) motion sequence, __Equation (46)__
+ `voronoi_2D_p1.m`, `voronoi_2D_p2.m`, `voronoi_2D_p3.m`, `voronoi_2D_p4.m`, `voronoi_2D_p6.m` Center Voronoi-like cell of Fundamental domain of SE(2) divided by p1, p2, p3, p4, p6 symmetry groups, __reproduction of Figure 5__
+ `voronoi_2D_p4_c5_double_coset.m` Center Voronoi-like cell of Fundamental domain of SE(2) divided by p4 and C5 groups, __reproduction of Figure 6__
+ `voronoi_icosahedron_group.m` `voronoi_octahedron_group.m` `voronoi_tetrahedron_group.m` Center Voronoi cell of Fundamental domain of Γ\SO(3) where Γ is icosahedral, octahedral, tetrahedral rotational symmetry groups respectively, __reproduction of Figure 1__
+ `voronoi_ico_ico_double_coset.m` `voronoi_ico_octa_double_coset.m` `voronoi_ico_tetra_double_coset.m` Center Voronoi cell of Fundamental domain of Γ\SO(3)/Δ where Γ is icosahedral group and Δ is icosahedral, octahedral, tetrahedral groups respectively, __reproduction of Figure 2__
+ `non_voronoi_ico_ico_double_coset.m` Fundamental domain of H\SO(3)/H where H is icosahedral group, __reproduction of Figure 3__
+ `sampling_SO3/comp_connectivity.m` `sampling_SO3/comp_consistency.m` `sampling_SO3/comp_density.m` `sampling_SO3/comp_dispersion` `sampling_SO3/comp_uniformity` Performance comparisons for SO(3) sampling using our double-coset decomposition, Euler angles (ZYZ) and Hopf fibration methods: _number of connected neighbors_, _consistency_, _density of neighborhood_, _dispersion_, _uniformity_, __results in Section 8.1.1__
+ `sampling_SO3/comp_query_accuracy.m` `sampling_SO3/comp_query_time.m` Benchmarks for SO(3) sampling using our double-coset decomposition, Euler angles (ZYZ) and Hopf fibration methods: Nearest neighbor search _accuracy_, _running time_, __results in Section 8.1.2 (including reproduction of Figure 8)__
+ `sampling_SO3/demo_fast_serach.m` `sampling_SO3/demo_fast_search_hk.m` Demonstration of fast hybrid nearest neighbor search algorithm via our double-coset decomposition method: using double cosets _H\SO(3)/H_, _H\SO(3)/K_ where H is icosahedral group and K is defined in Eq. (47), __results in Section 8.2__

# Paper
Please cite the associated paper as follows:
+ Wülker, C., Ruan, S. and Chirikjian, G.S., 2019. Quantizing Euclidean motions via double-coset decomposition. Research, 2019.
```
@article{wulker2019quantizing,
  title={Quantizing Euclidean motions via double-coset decomposition},
  author={W{\"u}lker, Christian and Ruan, Sipu and Chirikjian, Gregory S},
  journal={Research},
  volume={2019},
  year={2019},
  publisher={Science Partner Journal}
}
```
