{{/*
Expand the name of the chart.
*/}}
{{- define "CoFloEnterprise.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "CoFloEnterprise.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "CoFloEnterprise.labels" -}}
helm.sh/chart: {{ include "CoFloEnterprise.chart" . }}
{{ include "CoFloEnterprise.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "CoFloEnterprise.selectorLabels" -}}
app.kubernetes.io/name: {{ include "CoFloEnterprise.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}