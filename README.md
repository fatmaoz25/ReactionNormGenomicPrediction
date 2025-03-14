Grain yield is one of the most important agronomic traits of interest when studying maize. Grain yield is a complex trait that is controlled by many small-effect loci. Therefore, it is difficult to narrow down on the individual genes acting on this trait without reliable modeling scenarios and sufficient data. Aside from genetic variation, grain yield performance of genotypes is also impacted by their environment and genotype-by-environment (GxE) interaction effects. GxE effects arise when a genotype performs differently depending on the environment in which it is in. Thus, it is crucial to account for these additional sources of variation in the model to generate accurate predictions for breeding scenarios where certain genotypes/environments have not been observed/experimented.

GxE can be modeled in terms of the differential mean response across environments $(A)$ or in terms of all the combinations of the genotype:environment $(B)$. The former may be considered to be more computationally efficient than the latter because it requires less terms to be iterated through when performing genomic predictions.

- $(A):$

Regression on the mean model (Finlay-Wilkinson): $y$ is the vector for the dependent variable, $\mu$ is the grand mean, $G_{i}$ is the effect of the $ith$ genotype, $E_{j}$ is the effect of the $jth$ environment, $b_{i}E_{j}$ is the reaction norm parameter effect of the $ith$ genotype in the $jth$ environment, and $\varepsilon$ is the residual error not explained by the model.

$$y=\mu+G_{i}+E_{j}+b_{i}E_{j}+\varepsilon$$



- $(B):$

Additive effects model: $y$ is the vector for the dependent variable, $\mu$ is the grand means, $G_{i}$ is the effect of the $ith$ genotype, $E_{j}$ is the effect of the $jth$ envvironment, $GE_{ij}$ is the GxE interaction effect of the $ith$ genotype in the $jth$ environment, and $\varepsilon$ is the residual error not explained by the model.

$$y=\mu+G_{i}+E_{j}+GE_{ij}+\varepsilon$$

This study used the Genomes to Fields (G2F) 2020 and 2021 data set with the intention of conducting genomic prediction for grain yield (tons/hect.) using reaction norm parameters. Three hybrid tester populations derived from the cross between ex-PVP inbreds (PHK76, PHP02, and PHZ51) and the doubled haploid Wisconsin Stiff Stalk MAGIC population (W10004) were analyzed for a total of 174 hybrids. The study consisted of 29 unique environments across the U.S. to get the full scope of GxE patterns. The photothermal ratio (PTR) was used as a biologically-relevant weather parameter to numerically order the environments to obtain quantified values for grain yield stability for each hybrid. Two different genomic prediction models were conducted (refer to $A$ and $B$) to compare the results. 
