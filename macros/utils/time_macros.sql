{% macro trino__anamaly_detection_time_window_start() %}
    {{ time_window_start() }} - interval '{{var('re_data:anomaly_detection_look_back_days')}}' day
{% endmacro %}

{% macro trino__interval_length_sec(start_timestamp, end_timestamp) %}
   date_diff('second', {{ start_timestamp }}, {{ end_timestamp }})
{% endmacro %}

{% macro trino__in_time_window(time_column) %}
    cast({{time_column}} as timestamp) >= {{ time_window_start() }} and
    cast({{time_column}} as timestamp) < {{ time_window_end() }}
{% endmacro %}

{% macro trino__format_timestamp(column_name) %}
    FORMAT_DATETIME({{column_name}}, '%Y-%m-%d %H:%i:%S')
{% endmacro %}

{% macro trino__in_date_window(target, start_date, end_date) %}
  {% if start_date is not none and end_date is not none %}
    date({{target}}) between date '{{start_date}}' and date '{{end_date}}'
  {% elif start_date is none %}
    date({{target}}) <=  date '{{end_date}}'
  {% elif end_date is none %}
    date({{target}}) >= date '{{start_date}}'
  {% endif %}
{% endmacro %}

