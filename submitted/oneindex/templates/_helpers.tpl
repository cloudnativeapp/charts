{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "oneindex.name" -}}
{{- default "oneindex" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "oneindex.fullname" -}}
{{- $name := default "oneindex" .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Helm required labels */}}
{{- define "oneindex.labels.standard" -}}
heritage: {{ .Release.Service }}
release: {{ .Release.Name }}
chart: {{ .Chart.Name }}
app: "{{ include "oneindex.name" . }}"
{{- end -}}

{{/* matchLabels */}}
{{- define "oneindex.labels.matchLabels" -}}
release: {{ .Release.Name }}
app: "{{ include "oneindex.name" . }}"
{{- end -}}

{{- define "oneindex.autoGenCert" -}}
  {{- if and .Values.expose.tls.enabled (not .Values.expose.tls.secretName) -}}
    {{- printf "true" -}}
  {{- else -}}
    {{- printf "false" -}}
  {{- end -}}
{{- end -}}