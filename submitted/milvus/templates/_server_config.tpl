{{- define "milvus.serverConfig" -}}
# Copyright (C) 2019-2020 Zilliz. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under the License.

version: {{ .Values.version }} 

#----------------------+------------------------------------------------------------+------------+-----------------+
# Server Config        | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# address              | IP address that Milvus server monitors.                    | IP         | 0.0.0.0         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# port                 | Port that Milvus server monitors. Port range (1024, 65535) | Integer    | 19530           |
#----------------------+------------------------------------------------------------+------------+-----------------+
# deploy_mode          | Milvus deployment type:                                    | DeployMode | single          |
#                      |   single, cluster_readonly, cluster_writable               |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# time_zone            | Use UTC-x or UTC+x to specify a time zone.                 | Timezone   | UTC+8           |
#----------------------+------------------------------------------------------------+------------+-----------------+
# web_enable           | Enable web server or not.                                  | Boolean    | true            |
#----------------------+------------------------------------------------------------+------------+-----------------+
# web_port             | Port that Milvus web server monitors.                      | Integer    | 19121           |
#                      | Port range (1024, 65535)                                   |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
server_config:
  address: 0.0.0.0
  port: 19530
{{- if .Values.cluster.enabled }}
  deploy_mode: cluster_writable
{{- else }}
  deploy_mode: single
{{- end }}
  time_zone: {{ .Values.timeZone }}
  web_enable: {{ .Values.web.enabled }}
  web_port: 19121

#----------------------+------------------------------------------------------------+------------+-----------------+
# DataBase Config      | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# backend_url          | URL for metadata storage, using SQLite (for single server  | URL        | sqlite://:@:/   |
#                      | Milvus) or MySQL (for distributed cluster Milvus).         |            |                 |
#                      | Format: dialect://username:password@host:port/database     |            |                 |
#                      | Keep 'dialect://:@:/', 'dialect' can be either 'sqlite' or |            |                 |
#                      | 'mysql', replace other texts with real values.             |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# preload_collection   | A comma-separated list of collection names that need to    | StringList |                 |
#                      | be pre-loaded when Milvus server starts up.                |            |                 |
#                      | '*' means preload all existing tables (single-quote or     |            |                 |
#                      | double-quote required).                                    |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# auto_flush_interval  | The interval, in seconds, at which Milvus automatically    | Integer    | 1 (s)           |
#                      | flushes data to disk.                                      |            |                 |
#                      | 0 means disable the regular flush.                         |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
db_config:
{{- if not .Values.backendURL }}
  {{- if .Values.mysql.enabled }}
  backend_url: {{ template "milvus.mysqlURL" . }}
  {{- else }}
  backend_url: {{ template "milvus.sqliteURL" . }}
  {{- end }}
{{- else }}
  backend_url: {{ .Values.backendURL }}
{{- end }}
  preload_collection:
  auto_flush_interval: {{ .Values.autoFlushInterval }}

#----------------------+------------------------------------------------------------+------------+-----------------+
# Storage Config       | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# primary_path         | Primary directory used to save meta data, vector data and  | Path       | /var/lib/milvus |
#                      | index data.                                                |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# secondary_path       | A semicolon-separated list of secondary directories used   | Path       |                 |
#                      | to save vector data and index data.                        |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# file_cleanup_timeout | The time gap between marking a file as 'deleted' and       | Integer    | 10 (s)          |
#                      | physically deleting this file from disk, range [0, 3600]   |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
storage_config:
  primary_path: {{ .Values.primaryPath }}
  secondary_path:
  file_cleanup_timeout: {{ .Values.fileCleanupTimeout }}

#----------------------+------------------------------------------------------------+------------+-----------------+
# Metric Config        | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# enable_monitor       | Enable monitoring function or not.                         | Boolean    | false           |
#----------------------+------------------------------------------------------------+------------+-----------------+
# address              | Pushgateway address                                        | IP         | 127.0.0.1       +
#----------------------+------------------------------------------------------------+------------+-----------------+
# port                 | Pushgateway port, port range (1024, 65535)                 | Integer    | 9091            |
#----------------------+------------------------------------------------------------+------------+-----------------+
metric_config:
  enable_monitor: {{ .Values.metrics.enabled }}
  address: {{ .Values.metrics.address }}
  port: {{ .Values.metrics.port }}

#----------------------+------------------------------------------------------------+------------+-----------------+
# Cache Config         | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# cpu_cache_capacity   | The size of CPU memory used for caching data for faster    | Integer    | 4 (GB)          |
#                      | query. The sum of 'cpu_cache_capacity' and                 |            |                 |
#                      | 'insert_buffer_size' must be less than system memory size. |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# insert_buffer_size   | Buffer size used for data insertion.                       | Integer    | 1 (GB)          |
#                      | The sum of 'insert_buffer_size' and 'cpu_cache_capacity'   |            |                 |
#                      | must be less than system memory size.                      |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# cache_insert_data    | Whether to load data to cache for hot query                | Boolean    | false           |
#----------------------+------------------------------------------------------------+------------+-----------------+
cache_config:
  cpu_cache_capacity: {{ .Values.cache.cpuCacheCapacity }}
  insert_buffer_size: {{ .Values.cache.insertBufferSize }}
  cache_insert_data: {{ .Values.cache.cacheInsertData }}

#----------------------+------------------------------------------------------------+------------+-----------------+
# Engine Config        | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# use_blas_threshold   | A Milvus performance tuning parameter. This value will be  | Integer    | 1100            |
#                      | compared with 'nq' to decide if OpenBLAS should be used.   |            |                 |
#                      | If nq >= use_blas_threshold, OpenBLAS will be used, search |            |                 |
#                      | response time will be stable but the search speed will be  |            |                 |
#                      | slower; if nq < use_blas_threshold, AVX or SSE will be     |            |                 |
#                      | used, search speed will be faster but search response time |            |                 |
#                      | will fluctuate.                                            |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# gpu_search_threshold | A Milvus performance tuning parameter. This value will be  | Integer    | 1000            |
#                      | compared with 'nq' to decide if the search computation will|            |                 |
#                      | be executed on GPUs only.                                  |            |                 |
#                      | If nq >= gpu_search_threshold, the search computation will |            |                 |
#                      | be executed on GPUs only;                                  |            |                 |
#                      | if nq < gpu_search_threshold, the search computation will  |            |                 |
#                      | be executed on both CPUs and GPUs.                         |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
engine_config:
  use_blas_threshold: {{ .Values.useBLASThreshold }}
  gpu_search_threshold: {{ .Values.gpuSearchThreshold }}

#----------------------+------------------------------------------------------------+------------+-----------------+
# GPU Resource Config  | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# enable               | Enable GPU resources or not.                               | Boolean    | false           |
#----------------------+------------------------------------------------------------+------------+-----------------+
# cache_capacity       | The size of GPU memory per card used for cache.            | Integer    | 1 (GB)          |
#----------------------+------------------------------------------------------------+------------+-----------------+
# search_resources     | The list of GPU devices used for search computation.       | DeviceList | gpu0            |
#                      | Must be in format gpux.                                    |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# build_index_resources| The list of GPU devices used for index building.           | DeviceList | gpu0            |
#                      | Must be in format gpux.                                    |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
gpu_resource_config:
  enable: {{ .Values.gpu.enabled }}
  cache_capacity: {{ .Values.gpu.cacheCapacity }}
  {{- with .Values.gpu.searchResources }}
  search_resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with .Values.gpu.buildIndexResources }}
  build_index_resources:
    {{- toYaml . | nindent 4 }}
  {{- end }}

#----------------------+------------------------------------------------------------+------------+-----------------+
# Tracing Config       | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# json_config_path     | Absolute path for tracing config file.                     | Path       |                 |
#                      | Leave it empty, a no-op tracer will be created.            |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
tracing_config:
  json_config_path:

#----------------------+------------------------------------------------------------+------------+-----------------+
# WAL Config           | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# enable               | Whether to enable write-ahead logging (WAL) in Milvus.     | Boolean    | true            |
#                      | If WAL is enabled, Milvus writes all data changes to log   |            |                 |
#                      | files in advance before implementing data changes. WAL     |            |                 |
#                      | ensures the atomicity and durability for Milvus operations.|            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# recovery_error_ignore| Whether to ignore logs with errors that happens during WAL | Boolean    | true            |
#                      | recovery. If true, when Milvus restarts for recovery and   |            |                 |
#                      | there are errors in WAL log files, log files with errors   |            |                 |
#                      | are ignored. If false, Milvus does not restart when there  |            |                 |
#                      | are errors in WAL log files.                               |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# buffer_size          | Sum total of the read buffer and the write buffer in MBs.  | Integer    | 256 (MB)        |
#                      | buffer_size must be in range [64, 4096] (MB).              |            |                 |
#                      | If the value you specified is out of range, Milvus         |            |                 |
#                      | automatically uses the boundary value closest to the       |            |                 |
#                      | specified value. It is recommended you set buffer_size to  |            |                 |
#                      | a value greater than the inserted data size of a single    |            |                 |
#                      | insert operation for better performance.                   |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# wal_path             | Location of WAL log files.                                 | String     |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
wal_config:
  enable: {{ .Values.wal.enabled }}
  recovery_error_ignore: {{ .Values.wal.ignoreErrorLog }}
  buffer_size: {{ .Values.wal.bufferSize }}
  wal_path: {{ .Values.wal.path }}

#----------------------+------------------------------------------------------------+------------+-----------------+
# Logs                 | Description                                                | Type       | Default         |
#----------------------+------------------------------------------------------------+------------+-----------------+
# trace.enable         | Whether to enable trace level logging in Milvus.           | Boolean    | true            |
#----------------------+------------------------------------------------------------+------------+-----------------+
# debug.enable         | Whether to enable debug level logging in Milvus.           | Boolean    | true            |
#----------------------+------------------------------------------------------------+------------+-----------------+
# info.enable          | Whether to enable info level logging in Milvus.            | Boolean    | true            |
#----------------------+------------------------------------------------------------+------------+-----------------+
# warning.enable       | Whether to enable warning level logging in Milvus.         | Boolean    | true            |
#----------------------+------------------------------------------------------------+------------+-----------------+
# error.enable         | Whether to enable error level logging in Milvus.           | Boolean    | true            |
#----------------------+------------------------------------------------------------+------------+-----------------+
# fatal.enable         | Whether to enable fatal level logging in Milvus.           | Boolean    | true            |
#----------------------+------------------------------------------------------------+------------+-----------------+
# path                 | Absolute path to the folder holding the log files.         | String     |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
# max_log_file_size    | The maximum size of each log file, size range [512, 4096]  | Integer    | 1024 (MB)       |
#----------------------+------------------------------------------------------------+------------+-----------------+
# log_rotate_num       | The maximum number of log files that Milvus keeps for each | Integer    | 0               |
#                      | logging level, num range [0, 1024], 0 means unlimited.     |            |                 |
#----------------------+------------------------------------------------------------+------------+-----------------+
logs:
  trace.enable: true
  debug.enable: true
  info.enable: true
  warning.enable: true
  error.enable: true
  fatal.enable: true
  path: {{ .Values.logs.path }}
  max_log_file_size: {{ .Values.logs.maxLogFileSize }}
  log_rotate_num: {{ .Values.logs.logRotateNum }}

{{- end }}
