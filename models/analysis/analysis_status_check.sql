 WITH analysis_status_check AS (
    SELECT * FROM {{ ref('trans_eor_contracts')}}
)

SELECT
    contract_id,
    employment_country,
    organization_id,
    created_at,
    created_month,
    created_week,
    original_start_date,
    original_start_month,
    original_start_week,
    is_employee_signed_up,
    is_identity_verified,
    is_additional_info_loaded,
    is_bank_information_loaded,
    are_compliance_docs_loaded,
    is_employee_ea_signed,
    is_deel_ea_signed,
    is_ea_fully_signed,
    is_contract_delayed

FROM
    analysis_status_check