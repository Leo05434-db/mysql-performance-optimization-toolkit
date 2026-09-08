-- ========================================================================
-- MYSQL TOOLKIT: INNODB BUFFER POOL CACHE HIT RATIO
-- Target: Should be 99%+ for healthy production environments.
-- Less than 95% means the developer needs to increase innodb_buffer_pool_size.
-- ========================================================================

SELECT 
    variable_name,
    variable_value
FROM 
    information_schema.global_status
WHERE 
    variable_name IN ('Innodb_buffer_pool_read_requests', 'Innodb_buffer_pool_reads');

-- Note for README: Formula to show buyers to calculate their percentage manually 
-- if their UI tool doesn't compute math blocks:
-- Cache Hit Ratio = 100 * (1 - (Innodb_buffer_pool_reads / Innodb_buffer_pool_read_requests))
