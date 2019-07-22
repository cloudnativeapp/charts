{{ define "name" -}}
{{ printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}

{{- define "image" -}}
{{- $registryName := .Values.image.registry -}}
{{- $repositoryName := .Values.image.repository -}}
{{- $tag := .Values.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}
