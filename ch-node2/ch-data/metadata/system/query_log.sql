ATTACH TABLE query_log
(
    `type` Enum8('QueryStart' = 1, 'QueryFinish' = 2, 'ExceptionBeforeStart' = 3, 'ExceptionWhileProcessing' = 4), 
    `event_date` Date, 
    `event_time` DateTime, 
    `query_start_time` DateTime, 
    `query_duration_ms` UInt64, 
    `read_rows` UInt64, 
    `read_bytes` UInt64, 
    `written_rows` UInt64, 
    `written_bytes` UInt64, 
    `result_rows` UInt64, 
    `result_bytes` UInt64, 
    `memory_usage` UInt64, 
    `query` String, 
    `exception` String, 
    `stack_trace` String, 
    `is_initial_query` UInt8, 
    `user` String, 
    `query_id` String, 
    `address` IPv6, 
    `port` UInt16, 
    `initial_user` String, 
    `initial_query_id` String, 
    `initial_address` IPv6, 
    `initial_port` UInt16, 
    `interface` UInt8, 
    `os_user` String, 
    `client_hostname` String, 
    `client_name` String, 
    `client_revision` UInt32, 
    `client_version_major` UInt32, 
    `client_version_minor` UInt32, 
    `client_version_patch` UInt32, 
    `http_method` UInt8, 
    `http_user_agent` String, 
    `quota_key` String, 
    `revision` UInt32, 
    `thread_numbers` Array(UInt32), 
    `os_thread_ids` Array(UInt32), 
    `ProfileEvents.Names` Array(String), 
    `ProfileEvents.Values` Array(UInt64), 
    `Settings.Names` Array(String), 
    `Settings.Values` Array(String)
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(event_date)
ORDER BY (event_date, event_time)
SETTINGS index_granularity = 8192