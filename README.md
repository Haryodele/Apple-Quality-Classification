# Apple-Quality-Classification
## Project Overview
This project applies **classification modeling** to predict whether an apple is of **good quality or not**, using the Apple dataset.  
The analysis demonstrates a complete machine learning workflow — from **data preprocessing and visualization** to **model training, cross-validation, and evaluation**.

---

## Tools & Technologies
- **Programming Language:** R  
- **Libraries & Packages:** tidyverse, caret, pROC, psych, skimr  
- **Techniques Used:**  
  - Logistic Regression (GLM)  
  - 10-fold Cross-Validation (repeated)  
  - ROC Curve, AUC, and Confusion Matrix  

---


### 1. Data Preprocessing
- Imported dataset (`Apple.csv`).  
- Removed irrelevant identifiers (`A_id`).  
- Converted `Quality` column into a **factor variable** with two levels (*good* vs *not good*).  
- Partitioned dataset into **training (80%)** and **testing (20%)** sets.  

### 2. Exploratory Data Analysis (EDA)
- Visualized attribute relationships with pair plots.  
- Identified features most correlated with apple quality.  

### 3. Model Training
- Built a **logistic regression model** using repeated **10-fold cross-validation**.  
- Optimized based on **ROC metric** for robust classification performance.  

### 4. Model Evaluation
- Evaluated performance on unseen test data.  
- Generated **confusion matrix** and calculated **AUC (Area Under Curve)**.  
- Confirmed predictive power of the model with ROC curve analysis.  

---

##  Results & Insights
- The logistic regression model achieved strong classification performance, with a **high AUC score** indicating reliable predictions.  
- Clear separation between "good" and "not good" apples was observed from model probability outputs.  
- Demonstrated that **logistic regression** is effective for simple binary quality classification tasks in agriculture.  

---
