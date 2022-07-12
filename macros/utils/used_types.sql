{% macro trino__timestamp_type() %}
    timestamp 
{% endmacro %}

{% macro trino__string_type() %}
    varchar
{% endmacro %}

{% macro trino__numeric_type() %}
    double
{% endmacro %}
