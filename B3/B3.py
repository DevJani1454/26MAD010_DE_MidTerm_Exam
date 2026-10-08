from pathlib import Path

import pandas as pd

DATA_PATH = Path(__file__).resolve().parents[1] / "Dataset.csv"

emp = pd.read_csv(DATA_PATH, skip_blank_lines=True)
emp.columns = emp.columns.str.strip()
emp["emp_id"] = pd.to_numeric(emp["emp_id"], errors="coerce")
emp = emp.loc[emp["emp_id"].notna()].copy()
emp["name"] = emp["name"].str.strip()
emp["dept_id"] = pd.to_numeric(emp["dept_id"], errors="coerce").astype("Int64")
emp["salary"] = pd.to_numeric(emp["salary"], errors="coerce")

highest_paid = emp.loc[
    emp.groupby("dept_id")["salary"].idxmax(),
    ["dept_id", "name", "salary"],
].reset_index(drop=True)
print(highest_paid.to_string(index=False))
