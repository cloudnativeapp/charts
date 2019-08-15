{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "storybook.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "storybook.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "storybook.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "storybook.labels" -}}
app.kubernetes.io/name: {{ include "storybook.name" . }}
helm.sh/chart: {{ include "storybook.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "storybook.initgit" -}}
volumes:
  - name: source-vol
    emptyDir: {}
initContainers:
  - name: "{{ .Chart.Name }}-source-pull"
    image: alpine/git:latest
    command: ["git", "clone",{{- if .Values.source.branch }}"--branch","{{ .Values.source.branch }}",{{- end}} "{{ .Values.source.repo }}", "/source"]
    volumeMounts:
      - name: source-vol
        mountPath: /source
{{- end -}}

{{- define "storybook.mountvolume" -}}
volumeMounts:
  - name: source-vol
    mountPath: /storybook/src
{{- end -}}

