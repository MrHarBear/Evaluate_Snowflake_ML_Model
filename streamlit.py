# Import python packages
import streamlit as st
from snowflake.snowpark.context import get_active_session
import streamlit.components.v1 as components

# Write directly to the app
st.title("Drift Detection Reports")

# Get the current credentials
session = get_active_session()

# Get available reports
files = session.sql('LS @SWT2024_DEMO_AUTO_INSURANCE.NOTEBOOK.MONITORING').collect()
files = sorted(
    [file['name'] for file in files if file['name'].endswith('.html')],
    reverse=True
)
report_selection = st.selectbox('Select Report File:', files)

@st.cache_data
def get_report():
    file = session.file.get_stream(f'@CONTAINER_RUNTIME_LAB.NOTEBOOKS.{report_selection}').read()
    
    # Convert bytes to string
    html_content = file.decode('utf-8')
    return html_content

report = get_report()
components.html(report, width=1000, height=1200, scrolling=True)
