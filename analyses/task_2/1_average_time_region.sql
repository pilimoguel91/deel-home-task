SELECT
    employment_country,
    AVG(total_days_to_complete) AS avg_days_onboarding
FROM
    {{ ref('analysis_times_check')}}
GROUP BY employment_country