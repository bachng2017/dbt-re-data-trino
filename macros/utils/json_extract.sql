{% macro trino__json_extract_impl(string, string_path) %}

  json_extract_scalar({{string}}, {{ "'$." ~ string_path ~ "'" }} )

{% endmacro %}
