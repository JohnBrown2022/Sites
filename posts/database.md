# Tasks

## 1. DTI -- classification

- input: pair; 
- output: 0/1; or more classes
- detailed: affinity cut-off (ask itself)
- database [Drug-Target Interaction - TDC (tdcommons.ai)](https://tdcommons.ai/multi_pred_tasks/dti/)

## 2. Mols generation
### 2.1 Unconditional
- To enlarge mol chemical space ?;  fragments enlargement
- Prompt: similar mols to xxx; more scaffold; ...

### 2.2 Conditional
- One in one out
	- dataset: DTI
	- 
- Pair in, similarities out | in chat way
- Speific target fine-tuning
	- dataset: HTS

### 2.3 SBDD
- Some in, similarities out
	- dataset: SBDD

## 3. GeneDisease 

# Analysis
## 1.Basic metrics
- valid
- novelty
- ...

## 2. Mol presentations
- SMILES
- IUPAC name
- InChi
- ...

# More
## 1. Tools development
###  1.1 Input assistant webscript



