from pathlib import Path

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

DATA_PATH = Path(__file__).resolve().parents[1] / "Dataset.csv"
OUTPUT_PATH = Path(__file__).resolve().parent / "salary_plots.png"

emp = pd.read_csv(DATA_PATH, skip_blank_lines=True)
emp.columns = emp.columns.str.strip()
emp["emp_id"] = pd.to_numeric(emp["emp_id"], errors="coerce")
emp = emp.loc[emp["emp_id"].notna()].copy()
emp["name"] = emp["name"].str.strip()
emp["dept_id"] = pd.to_numeric(emp["dept_id"], errors="coerce").astype("Int64")
emp["salary"] = pd.to_numeric(emp["salary"], errors="coerce")

fig, axes = plt.subplots(1, 2, figsize=(12, 5))

sns.histplot(data=emp, x="salary", ax=axes[0])
axes[0].set_title("Salary Distribution")
axes[0].set_xlabel("Salary")

sns.boxplot(data=emp, x="dept_id", y="salary", ax=axes[1])
axes[1].set_title("Salary by Department")
axes[1].set_xlabel("Department ID")
axes[1].set_ylabel("Salary")

fig.tight_layout()
fig.savefig(OUTPUT_PATH, dpi=150)
plt.show()
