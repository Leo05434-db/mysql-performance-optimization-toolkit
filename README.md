# MySQL Production Performance & Diagnostic Toolkit

A collection of production-safe, non-destructive SQL diagnostic scripts designed to audit database health, isolate query bottlenecks, and tune InnoDB memory allocations.

## 🚀 The Core Problem
When production traffic spikes, finding database bottlenecks often requires hours of parsing system schemas (`information_schema` and `performance_schema`). This repository provides a lightweight framework to safely diagnose MySQL database degradation in under 60 seconds.

---

## 🎁 Free Teaser: InnoDB Buffer Pool Cache Hit Ratio Check
A safe, read-only script to calculate whether your active data fits cleanly into your server's RAM or if it is thrashing your disk storage. Target should be 99%+ for healthy production environments.

```sql
SELECT 
    variable_name,
    variable_value,
    CASE 
        WHEN variable_name = 'Innodb_buffer_pool_reads' THEN 'Physical disk reads (Lower is better)'
        WHEN variable_name = 'Innodb_buffer_pool_read_requests' THEN 'Memory read requests (Higher is better)'
    END AS metric_description
FROM 
    information_schema.global_status
WHERE 
    variable_name IN ('Innodb_buffer_pool_read_requests', 'Innodb_buffer_pool_reads');
```

*Formula: `Cache Hit Ratio = 100 * (1 - (Innodb_buffer_pool_reads / Innodb_buffer_pool_read_requests))`*

---

## ⚡ Unlock the Full Automation Bundle ($39)
The complete, fully formatted toolkit includes critical scripts to isolate missing indexes, analyze table fragmentation, and track heavy statements.

### 📦 What's Included in the Full Premium Kit:
*   **01_mysql_missing_and_unused_indexes.sql:** Locates tables suffering from full table scans and flags dead indexes.
*   **03_mysql_table_fragmentation.sql:** Pinpoints data page gaps to reclaim physical disk space.
*   **04_mysql_heavy_statement_tracker.sql:** Ranks top heavy query patterns by cumulative execution runtime.
*   **Comprehensive Markdown Guide:** Step-by-step documentation for resolving performance metrics.

👉 [Download the Full Production MySQL Toolkit on Gumroad for $39](https://leonova027.gumroad.com/l/mysql-performance-toolkit)

---
*Maintained by @Leo05434-db. Contact: leo05434@proton.me.*
