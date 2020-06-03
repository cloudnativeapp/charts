{{- define "milvus.mishards.config" -}}
FROM_EXAMPLE='true'

{{- if .Values.mysql.enabled }}
SQLALCHEMY_DATABASE_URI={{ template "milvus.mysqlURL" . }}
{{- else }}
SQLALCHEMY_DATABASE_URI={{ template "milvus.sqliteURL" . }}
{{- end }}

DEBUG={{ .Values.mishards.debug }}
SERVER_PORT=19530
WOSERVER=tcp://{{ template "milvus.writable.fullname" . }}:{{ .Values.service.port }}
DISCOVERY_PLUGIN_PATH=static
DISCOVERY_STATIC_HOSTS={{ template "milvus.writable.fullname" . }},{{ template "milvus.readonly.fullname" . }}
DISCOVERY_STATIC_PORT={{ .Values.service.port }}

TRACER_CLASS_NAME=jaeger
TRACING_SERVICE_NAME=mishards-demo
TRACING_REPORTING_HOST=jaeger
TRACING_REPORTING_PORT=5775
{{- end -}}