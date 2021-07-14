{{/*
Expand the name of the chart.
*/}}
{{- define "clicker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "clicker.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "clicker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "clicker.labels" -}}
helm.sh/chart: {{ include "clicker.chart" . }}
{{ include "clicker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "clicker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "clicker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "clicker.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "clicker.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the hostname of ingress
*/}}
{{- define "clicker.ingress.hostname" -}}
{{- if eq .Values.namespace "default" }}
click.control.clickthebutton.click
{{- else }}
click.pub.clickthebutton.click
{{- end }}
{{- end }}

{{/*
Get the tag suffix
*/}}
{{- define "clicker.tag.suffix" -}}
{{- if eq .Values.namespace "default" -}}
-dev
{{- else -}}
-prod
{{- end }}
{{- end }}