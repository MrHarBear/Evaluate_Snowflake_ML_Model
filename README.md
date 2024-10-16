# ⛐Evaluate your Snowflake ML Models and Detect Drifts⛐
From Snowflake World Tour London 2024: Ever trained a model inside Snowflake and thought, "What's next?"🤔 How do you keep it accurate and stop it from drifting away🎯? In this demo, I share the techniques to evaluate and monitor your ML models!

### What We'll Do:
1. **Data Ingestion**: Fetch claims and customer data from the GitHub repository.
2. **Transformation and Feature Engineering**: Utilize Snowpark DataFrames for data preparation and analysis. We also save this into our Feature Store (With a tiny bit of LLM fun 😉)
3. **Model Training**: We Train a XGB Classifier model and store it in the Snowflake Model Registry
4. **Model Metrics**: Utilize Accuracy and ROC AUC scores to understand our model performance. With new claims data, we need to understand if the model accuracy has changed
5. **Drift Detection ⛐**: We utilize Population Stability Index and Kernel Density Estimates to help us understand if there are any feature drifts
6. **Drift Report**: We will produce drift reports, both as a Streamlit app and email notification
7. **Automate retraining pipeline**: we can package the retraining and registering of a model into a function and schedule the notebook to run over time

## Pre-Reqs
- We are using the `ACCOUNTADMIN` role in this case. If you are using a different role, ensure the appropriate privileges are granted.
- If you are using a trial account, you can ignore the first notebook (i.e. part 0), but you will need to manually upload the `csv` files into Snowflake and in the `DATA` schema.

## Setup
1. Run the `Setup.sql` script in Snowflake, this will create all the necessary objects
- **Database**: `SWT2024_DEMO_AUTO_INSURANCE`
- **Warehouse**: `NOTEBOOK`
- **Network Rule**: `GITHUB_NETWORK_RULE`
- **External Access Integration**: `GITHUB_EXTERNAL_ACCESS_INTEGRATION`
- **NOTIFICATION INTEGRATION**: `drift_report_email_integration`
2. Upload the 3 Notebooks into the `SWT2024_DEMO_AUTO_INSURANCE.NOTEBOOK` schema
4. Run through each of the notebook and enjoy!


## Any question just let me know!
