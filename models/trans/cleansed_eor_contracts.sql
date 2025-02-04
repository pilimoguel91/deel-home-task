{{
    config(
        materialized = 'view',
        indexes=[
      {'columns': ['organization_id']},
      {'columns': ['contract_id'], 'unique': True},
    ]
        )
 }}
 WITH cleansed_eor_contracts AS (
    SELECT * FROM {{ ref('src_eor_contracts')}}
)

SELECT
    contract_id,
    employment_country,
    organization_id,
    created_at::date,
    employee_signup_at::date,
    verify_identity_at::date,
    employee_additional_info_at::date,
    employee_bank_details_at::date,
    employee_compliance_docs_at::date,
    employee_sign_ea_at::date,
    deel_sign_ea_at::date,
    original_start_date::date,
    actual_start_date::date

FROM
    cleansed_eor_contracts