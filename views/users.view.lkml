view: users {
  sql_table_name: `ecomm.users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  dimension: full_name{
  type: string
  sql: concat(${first_name}," ",${last_name});;
  }
  dimension: length {
    type: number
    sql: length(${full_name}) ;;
  }
  dimension: color{
    type: number
    sql: ${length} ;;
    html: {% if value >15 %}
    <<font color="red">{{ rendered_value }}</font>
    {% elsif value > 20 %}
    <font color="yellow">{{ rendered_value }}</font>
    {% else %}
      <font color="blue">{{ rendered_value }}</font>
    {% endif %};;
  }
  dimension: value {
    sql: ${full_name};;
    type: string
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
measure: avgage {
  type: average
  sql: ${age} ;;
}
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      atom_events.count,
      atom_order_items.count,
      combined_orders_users.count,
      events.count,
      order_items.count
    ]
  }
}
