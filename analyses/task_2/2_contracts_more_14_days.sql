SELECT
    contract_id,
    organization_id,
    total_days_to_complete
FROM
    {{ ref('analysis_times_check')}}
WHERE total_days_to_complete > 14