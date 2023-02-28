{% macro db_source(source_name, table_name) %}
{% if target.name == 'dv' %}
{{ source(source_name + '-dv',table_name)}}
{% elif target.name == 'qa' %}
{{ source(source_name + '-qa',table_name)}}
{% else %}
{{ source(source_name + '-pd',table_name)}}
{% endif %}

{% endmacro %}

