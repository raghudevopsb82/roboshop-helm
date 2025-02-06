{{- define "common.labels" }}
  labels:
    app: {{ .Values.appName }}
    appName: {{ .Values.appName }}
    helmChartVersion: {{ .Chart.Version }}
    helmChartName: {{ .Chart.Name }}
    appVersion: {{ .Values.appVersion | default "latest" }}
{{- end }}
