view: order_items {
  sql_table_name: `ecomm.order_items`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: no
    type: number
    sql: ${TABLE}.id ;;

  }
  dimension: ids {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    html:
    {% if value > 10 %}
      <font color="darkgreen">{{ rendered_value }}</font>
    {% elsif value > 11 %}
      <font color="goldenrod">{{ rendered_value }}</font>
    {% else %}
      <font color="darkred">{{ rendered_value }}</font>
    {% endif %} ;;
  }

  dimension: value {
    sql: ${TABLE}.status ;;
    type: string
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

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    hidden: yes
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
    filters: [created_year: "2018"]
  }
measure: total_revenue {
  type: sum
  sql: ${sale_price} ;;
}
  measure: count_without_liquid {
    type: count
    link: {
      label: "SSSS"
      url: "https://www.youtube.com/"
    }
  }

  measure: count_with_liquid {
    type: count
    link: {
      label: "Status Count"
      url: "https://www.google.com/search?q={{ status._value }}"
    }
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}
