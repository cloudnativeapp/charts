{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "milvus.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "milvus.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified mishards name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus.mishards.fullname" -}}
{{ template "milvus.fullname" . }}-mishards
{{- end -}}

{{/*
Create a default fully qualified ro-milvus name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus.readonly.fullname" -}}
{{ template "milvus.fullname" . }}-readonly
{{- end -}}

{{/*
Create a default fully qualified writable-milvus name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus.writable.fullname" -}}
{{ template "milvus.fullname" . }}-writable
{{- end -}}

{{/*
Create a default fully qualified admin-milvus name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "milvus.admin.fullname" -}}
{{ template "milvus.fullname" . }}-admin
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "milvus.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Helm required labels */}}
{{- define "milvus.labels" -}}
helm.sh/chart: {{ include "milvus.chart" . }}
{{ include "milvus.matchLabels" . }}
{{- if or .Chart.AppVersion .Values.image.tag }}
app.kubernetes.io/version: {{ .Values.image.tag | default .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* matchLabels */}}
{{- define "milvus.matchLabels" -}}
app.kubernetes.io/name: {{ include "milvus.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use for the mishards component
*/}}
{{- define "milvus.serviceAccountName.mishards" -}}
{{- if .Values.serviceAccounts.mishards.create -}}
    {{ default (include "milvus.mishards.fullname" .) .Values.serviceAccounts.mishards.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccounts.mishards.name }}
{{- end -}}
{{- end -}}

{{/* Milvus backend URL */}}
{{- define "milvus.mysqlURL" -}}
mysql://root:{{ .Values.mysql.mysqlRootPassword }}@{{ .Release.Name }}-mysql:3306/{{ .Values.mysql.mysqlDatabase }}
{{- end -}}
{{- define "milvus.sqliteURL" -}}
sqlite://:@:/
{{- end -}}
