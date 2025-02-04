
--- AGGREGATION LAYER IS USEFUL FOR BI TOOLS LOW CONSUMPTION OF RESOURCES IN PROCESSING

 WITH analysis_agg_layer AS (
    SELECT * FROM {{ ref('trans_eor_contracts')}}
)

SELECT
--- CREATED MONTH AND WEEK ARE PRESENT IN ALL GROUPING SETS
    created_month,
    created_week,
---- COALESCE ALL THE FIELDS CONTAINED IN THE GROUPING SETS, AS A NEW ROW WILL BE CREATED FOR EACH WITH THE TOTAL NUMBER OF CONTRACTS/ORGANIZATIONS
    COALESCE(employment_country, NULL) AS employment_country,
    COALESCE(original_start_month, NULL) AS original_start_month,
    COALESCE(original_start_week, NULL) AS original_start_week,
    COALESCE(days_to_signup, NULL) AS days_to_signup,
    COALESCE(days_to_verify_identity, NULL) AS days_to_verify_identity,
    COALESCE(days_to_additional_info, NULL) AS days_to_additional_info,
    COALESCE(days_to_bank_details, NULL) AS days_to_bank_details,
    COALESCE(days_to_compliance_docs, NULL) AS days_to_compliance_docs,
    COALESCE(days_to_sign_ea_employee,NULL) AS days_to_sign_ea_employee,
    COALESCE(days_to_sign_ea_deel, NULL) AS days_to_sign_ea_deel,
    COALESCE(total_days_to_complete, NULL) AS total_days_to_complete,
    COALESCE(is_employee_signed_up, NULL) AS is_employee_signed_up,
    COALESCE(is_identity_verified, NULL) AS is_identity_verified,
    COALESCE(is_additional_info_loaded, NULL) AS is_additional_info_loaded,
    COALESCE(is_bank_information_loaded, NULL) AS is_bank_information_loaded,
    COALESCE(are_compliance_docs_loaded, NULL) AS are_compliance_docs_loaded,
    COALESCE(is_employee_ea_signed, NULL) AS is_employee_ea_signed,
    COALESCE(is_deel_ea_signed, NULL) AS is_deel_ea_signed,
    COALESCE(is_ea_fully_signed, NULL) AS is_ea_fully_signed,
    COALESCE(is_contract_delayed, NULL) AS is_contract_delayed
--- GET THE NUMBER OF CONTRACTS AND ORGANIZATIONS PER GROUPING SET
    COUNT(DISTINCT contract_id) AS number_contracts,
    COUNT(DISTINCT organization_id) AS number_organizations,
FROM
    analysis_agg_layer
GROUP BY GROUPING SETS (
    (created_month, created_week),
    (created_month, created_week, original_start_month),
    (created_month, created_week, original_start_week),
    (created_month, created_week, original_start_week, original_start_month),
    (created_month, created_week, original_start_week, original_start_month, is_contract_delayed),
    (created_month, created_week, original_start_month, is_contract_delayed),
    (created_month, created_week, employment_country),
    (created_month, created_week, is_contract_delayed),
    (created_month, created_week, days_to_signup),
    (created_month, created_week, days_to_verify_identity),
    (created_month, created_week, days_to_additional_info),
    (created_month, created_week, days_to_bank_details),
    (created_month, created_week, days_to_compliance_docs),
    (created_month, created_week, days_to_sign_ea_employee),
    (created_month, created_week, days_to_sign_ea_deel),
    (created_month, created_week, total_days_to_complete),
    (created_month, created_week, is_employee_signed_up),
    (created_month, created_week, is_identity_verified),
    (created_month, created_week, is_additional_info_loaded),
    (created_month, created_week, is_bank_information_loaded),
    (created_month, created_week, are_compliance_docs_loaded),
    (created_month, created_week, is_employee_ea_signed),
    (created_month, created_week, is_deel_ea_signed),
    (created_month, created_week, is_ea_fully_signed)
)