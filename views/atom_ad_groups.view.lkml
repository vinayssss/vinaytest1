view: atom_ad_groups {
  sql_table_name: `ecomm.atom_ad_groups`
    ;;

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}.ad_type ;;
  }

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: created_at_advance {
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
    sql: ${TABLE}.created_at_advance ;;
  }

  dimension: headline {
    type: string
    sql: ${TABLE}.headline ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: period {
    type: number
    sql: ${TABLE}.period ;;
  }

  measure: count {
    type: count
    drill_fields: [name, campaigns.campaign_name, campaigns.id]
  }
}
