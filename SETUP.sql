-- Run this script on Snowflake to create db, schema and required objects.
CREATE DATABASE IF NOT EXISTS SWT2024_DEMO_AUTO_INSURANCE;
CREATE SCHEMA IF NOT EXISTS DATA;
CREATE SCHEMA IF NOT EXISTS NOTEBOOK;
USE DATABASE SWT2024_DEMO_AUTO_INSURANCE;
USE SCHEMA NOTEBOOK;
-- Create stage to store our Streamlit reports
CREATE STAGE IF NOT EXISTS MONITORING
    ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
    DIRECTORY = (ENABLE = true);
CREATE OR REPLACE WAREHOUSE DEMO_WH
  WAREHOUSE_SIZE = 'X-Small'
  AUTO_SUSPEND = 60
  -- here we can use large memory warehouses if we wanted to
  -- WAREHOUSE_TYPE = { STANDARD | 'SNOWPARK-OPTIMIZED' } 
  -- RESOURCE_CONSTRAINT = { MEMORY_1X| MEMORY_1X_x86 | MEMORY_16X | MEMORY_16X_x86 | MEMORY_64X | MEMORY_64X_x86 }
  ;

-- Network Policy Rule for GitHub
CREATE OR REPLACE NETWORK RULE GITHUB_NETWORK_RULE
  MODE = EGRESS 
  TYPE = HOST_PORT VALUE_LIST = ('github.com', 'raw.githubusercontent.com','media.githubusercontent.com')
  COMMENT = 'Allow access to GitHub';

-- External Access Integration for the Policy and Notebook Integration
CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION GITHUB_EXTERNAL_ACCESS_INTEGRATION
    ALLOWED_NETWORK_RULES = ('GITHUB_NETWORK_RULE')
    ENABLED = TRUE
    COMMENT = 'External access integration for GitHub';