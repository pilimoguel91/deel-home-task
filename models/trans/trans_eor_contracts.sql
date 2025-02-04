 WITH trans_eor_contracts AS (
    SELECT * FROM {{ ref('cleansed_eor_contracts')}}
)

SELECT
    contract_id,
    employment_country,
    organization_id,
    created_at,
    TO_CHAR(created_at, 'YYYY-MM') AS created_month,
    TO_CHAR(created_at, 'YYYY-WW') AS created_week,
    employee_signup_at,
    CASE WHEN employee_signup_at IS NOT NULL THEN true ELSE false END AS is_employee_signed_up,
    EXTRACT(DAY FROM DATE_TRUNC('DAY', created_at) - DATE_TRUNC('DAY', employee_signup_at)) AS days_to_signup,
    verify_identity_at,
    CASE WHEN verify_identity_at IS NOT NULL THEN true ELSE false END AS is_identity_verified,
    EXTRACT(DAY FROM DATE_TRUNC('DAY', created_at) - DATE_TRUNC('DAY', verify_identity_at)) AS days_to_verify_identity,
    employee_additional_info_at,
    CASE WHEN employee_additional_info_at IS NOT NULL THEN true ELSE false END AS is_additional_info_loaded,
    EXTRACT(DAY FROM DATE_TRUNC('DAY', created_at) - DATE_TRUNC('DAY', employee_additional_info_at)) AS days_to_additional_info,
    employee_bank_details_at,
    CASE WHEN employee_bank_details_at IS NOT NULL THEN true ELSE false END AS is_bank_information_loaded,
    EXTRACT(DAY FROM DATE_TRUNC('DAY', created_at) - DATE_TRUNC('DAY', employee_bank_details_at)) AS days_to_bank_details,
    employee_compliance_docs_at,
    CASE WHEN employee_compliance_docs_at IS NOT NULL THEN true ELSE false END AS are_compliance_docs_loaded,
    EXTRACT(DAY FROM DATE_TRUNC('DAY', created_at) - DATE_TRUNC('DAY', employee_compliance_docs_at)) AS days_to_compliance_docs,
    employee_sign_ea_at,
    CASE WHEN employee_sign_ea_at IS NOT NULL THEN true ELSE false END AS is_employee_ea_signed,
    EXTRACT(DAY FROM DATE_TRUNC('DAY', created_at) - DATE_TRUNC('DAY', employee_sign_ea_at)) AS days_to_sign_ea_employee,
    deel_sign_ea_at,
    CASE WHEN deel_sign_ea_at IS NOT NULL THEN true ELSE false END AS is_deel_ea_signed,
    EXTRACT(DAY FROM DATE_TRUNC('DAY', created_at) - DATE_TRUNC('DAY', deel_sign_ea_at)) AS days_to_sign_ea_deel,
    CASE WHEN employee_sign_ea_at IS NOT NULL AND deel_sign_ea_at IS NOT NULL THEN true ELSE false END AS is_ea_fully_signed,
    original_start_date,
    TO_CHAR(original_start_date, 'YYYY-MM') AS original_start_month,
    TO_CHAR(original_start_date, 'YYYY-WW') AS original_start_week,
    actual_start_date,
    CASE WHEN original_start_date < actual_start_date THEN true ELSE false END AS is_contract_delayed,
    EXTRACT(DAY FROM DATE_TRUNC('DAY', created_at) - DATE_TRUNC('DAY', actual_start_date)) AS total_days_to_complete

FROM
    trans_eor_contracts