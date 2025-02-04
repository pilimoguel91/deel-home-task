 WITH analysis_times_check AS (
    SELECT * FROM {{ ref('trans_eor_contracts')}}
)

SELECT
    contract_id,
    employment_country,
    organization_id,
    created_at,
    created_month,
    created_week
    original_start_date,
    original_start_month,
    original_start_week,
    days_to_signup,
    days_to_verify_identity,
    days_to_additional_info,
    days_to_bank_details,
    days_to_compliance_docs,
    days_to_sign_ea_employee,
    days_to_sign_ea_deel,
    total_days_to_complete
FROM
    analysis_times_check