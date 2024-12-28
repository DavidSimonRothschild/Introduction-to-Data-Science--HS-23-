# Swiss Referendum Analysis: Canton of Zurich (2000-2023)

This repository contains the code and analysis for examining voting patterns across different policy fields in referendums held in the Canton of Zurich between 2000 and 2023. This work was completed as part of the "Introduction to Data Science" course (Fall 2023) at the University of Zurich.

## Project Overview

This analysis investigates how voter approval in the Canton of Zurich varies across different policy areas in referendums. The study uses machine learning approaches (KNN, ANN, and GLM) to analyze voting patterns and identify trends in policy-specific voter behavior.

## Course Context

- Course: Introduction to Data Science
- Semester: Fall 2023 (HS 23)
- Institution: University of Zurich
- Lecturer: Prof. Dr. Marco Steenbergen

## Data Source

The analysis uses the "Abstimmungsarchiv des Kantons Zürich ab 1831" dataset from the Statistical Office of Canton Zurich, focusing on:
- Voting period: 2000-2023
- Geographic scope: Canton of Zurich
- Total referendums analyzed: 409 votes

Dataset link: [Abstimmungsarchiv des Kantons Zürich](https://www.zh.ch/de/politik-staat/statistik-daten/datenkatalog.html#/datasets/714@statistisches-amt-kanton-zuerich)

## Methods Used

- K-Nearest Neighbors (KNN)
- Artificial Neural Network (ANN)
- Generalized Linear Model (GLM)
- Data visualization using ggplot2

## Policy Fields Analyzed

1. Environment and Transport (Umwelt und Verkehr)
2. Health (Gesundheit)
3. Social Affairs (Soziales)
4. Economy (Wirtschaft)
5. Democracy (Demokratie)
6. Church and State (Kirche und Staat)
7. Migration
8. Others (Weitere)

## Requirements

The analysis uses R with the following key packages:
- tidyverse
- tidymodels
- brulee
- DALEXtra


## Code Structure

The repository includes:
1. Data preprocessing scripts
2. Model implementation (KNN, ANN, GLM)
3. Visualization code
4. Analysis utilities

## Results

The analysis revealed:
- Different approval patterns across policy areas
- Law and order policies showed highest approval (76.93%)
- Military policies showed lower support (55.17%)
- Models showed moderate predictive power with opportunities for improvement

## Limitations

- Limited sample size affected model performance
- Policy area categorization could be refined
- Computing power constraints led to focus on canton-level rather than municipality-level data

## Future Work

Potential improvements include:
- Expanding the analysis to all Swiss votes
- Refining policy area categorization
- Implementing more sophisticated models
- Including municipality-level analysis

## Acknowledgments

- Prof. Dr. Marco Steenbergen (Course Lecturer)
- Statistical Office of Canton Zurich (Data Provider)
- Analysis assistance: ChatGPT and GitHub Copilot
- Code snippet visualization: Carbon (https://carbon.now.sh)

## Citation

If you use this code or analysis, please cite:
```
Rothschild, D. (2023). Polling success in various policy fields, using the example of referendums 
in the Canton of Zurich in the period 2000 to 2023. Introduction to Data Science Course Project, 
University of Zurich.
```
