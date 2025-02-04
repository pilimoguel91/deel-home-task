#  Deel Home Task
## Important

- For easier task development, I did the task #4 prior to task #2, so queries from task #2 are based on the analytical layers created on task #4 
- All the code used for the 3 firsts tasks are on this repo.
- Presentation can be found [here]().


### Task #1

**Objective**: Evaluate the ability to analyze and interpret key metrics from operational data.
**Scenario**: Analyze the activation process for contracts. Highlight bottlenecks and provide
actionable insights.
**Instructions**:
- Calculate % contracts where the Start date was delayed.
- Break down into the top reasons why these contracts were delayed.
- Draw some hypothesis on why contracts might be delayed and suggest actionable
recommendations to improve the onboarding timeline.

#### Solution
- Code is under [Task 1 Notebook](Analytics_Task.ipynb) - Jupyter Notebook
- Interpretation and observations are in [Task PDF](Analytics_Task.pdf) - Slides

### Task #2
**Objective**: Assess the SQL proficiency in extracting meaningful insights from structured data.
**Scenario**: Deel wants to monitor the efficiency of contract activations across different regions.
actionable insights.
**Instructions**:
- Write a query to calculate the average onboarding time (in days) for contracts by region.
- Write a query to list all contracts where onboarding exceeded 14 days. 
- Write a query to get the average (%) of onboardings delayed by week.

#### Solution 
- Code is under [analyses/task_2](analyses/task_2), it is referencing the views created in task 3. 

### Task #3
**Objective**: Assess the ability to design scalable and logical data pipelines.
**Scenario**: Deel aims to create a robust reporting system for contract activations.
**Instructions**:
- Design a data pipeline with the following layers:
  1. Ingestion Layer: Source data from eor_contracts_activated.csv.
  2. Transformation Layer: Include timestamp calculations for key milestones (e.g.,
  document submission, contract started).
  3. Analytics Layer: The final table/s which are going to be used from the end users
  and in the BI tool. Please present the structure of your final table(s) with all the
  columns/fields you would like to include, along with their format; e.g. | col_name1 |
  col_name2 | col_name3| etc.)

#### Solution
- The layers are done with dbt and therefore under [models](models)

### Task #4
**Objective**: Evaluate the understanding of A/B testing principles and their application.
**Scenario**: Deel implemented a new feature to automatically review the compliance documents
using AI. The feature was tested with a subset of users.
**Instructions**:
- Describe the methodology to set up this A/B test, including the control and variant groups. 
- Describe which metric/metrics you would validate the success of the experiment
- Assuming the Variant got better results than the Control, explain why the results were
statistically significant and recommend whether the feature should be rolled out to all users.

#### Solution
- The description and interpretation is added in the [slides](Analytics_Task.pdf)


### Thanks! 