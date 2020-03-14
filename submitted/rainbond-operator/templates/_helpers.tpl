{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "rainbond-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the rainbond-operator service account to use
*/}}
{{- define "rainbond-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "rainbond-operator.name" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}