
SELECT original_start_week,
       ROUND(AVG(100 * delayed_contracts/total_contracts), 2) AS avg_delayed_contacts
FROM (
    SELECT
        --- TAKE THE ORIGINAL START WEEK OF THE YEAR
        original_start_week,
        --- GET ALL THE CONTRACTS
        COUNT(DISTINCT contract_id),
        --- GET ALL THE DELAYED CONTRACTS
        COUNT(DISTINCT CASE WHEN is_contract_delayed = true THEN contract_id ELSE NULL END) AS delayed_contracts,
    FROM
        {{ ref('analysis_status_check')}}
    GROUP BY original_start_week

    )
GROUP BY original_start_week