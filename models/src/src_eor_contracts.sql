WITH raw_contracts AS (
    SELECT * FROM {{ source('pilarmoguel', 'eor_contracts_activated')}}
)

SELECT
    'Contract id' AS contract_id,
    'Employment Country Name' AS employment_country,
    'Organization ID' AS organization_id,
    'Created At Date' AS created_at,
    'Employee Signup At Date' AS employee_signup_at,
    'Step Verify Your Identity Completed At Date' AS verify_identity_at,
    'Employee Provided Additional Info At Date' AS employee_additional_info_at,
    'Employee Provided Bank Details Date' AS employee_bank_details_at,
    'Employee Provided Compliance Docs Date' AS employee_compliance_docs_at,
    'Employee Sign Ea At Date' AS employee_sign_ea_at,
    'Deel Countersign Ea At Date' AS deel_sign_ea_at,
    'Original Start Date' AS original_start_date,
    'Actual Start Date' AS actual_start_date
FROM
    raw_contracts